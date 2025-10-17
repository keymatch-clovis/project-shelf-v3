import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_money_rule.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_required_rule.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_product_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/app/dto/create_invoice_request.dart';
import 'package:project_shelf_v3/app/dto/update_invoice_draft_request.dart';
import 'package:project_shelf_v3/app/use_case/customer/find_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/create_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/create_invoice_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/find_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/update_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/find_product_use_case.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/common/debouncer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_draft.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/selected_invoice_draft_provider.dart';
import 'package:project_shelf_v3/injectable.dart';

part "create_invoice_provider.freezed.dart";

/// State related

enum CreateInvoiceStatus { INITIAL, SAVING_DRAFT, LOADING, SUCCESS }

@freezed
abstract class CreateInvoiceState with _$CreateInvoiceState {
  const factory CreateInvoiceState({
    @Default(CreateInvoiceStatus.INITIAL) CreateInvoiceStatus status,
    required Currency currency,
    required Id invoiceDraftId,
    required Input<DateTime> dateInput,
    required Input<CustomerDto> customerInput,
    required Input<String> remainingUnpaidBalanceInput,
    required Map<String, InvoiceProductDto> invoiceProducts,
  }) = _CreateInvoiceState;

  const CreateInvoiceState._();

  bool get isValid => <bool>[
    dateInput.errors.isEmpty,
    customerInput.errors.isEmpty,
    invoiceProducts.isNotEmpty,
    status == CreateInvoiceStatus.INITIAL,
  ].every((el) => el);

  Money get totalValue {
    return invoiceProducts.values.fold(Money.fromNumWithCurrency(0, currency), (
      acc,
      it,
    ) {
      return acc + it.total;
    });
  }
}

/// Provider related
final class CreateInvoiceAsyncNotifier
    extends AsyncNotifier<CreateInvoiceState> {
  final _findProductUseCase = getIt.get<FindProductUseCase>();
  final _findCustomerUseCase = getIt.get<FindCustomerUseCase>();
  final _findInvoiceDraftUseCase = getIt.get<FindInvoiceDraftUseCase>();
  final _createInvoiceDraftUseCase = getIt.get<CreateInvoiceDraftUseCase>();
  final _updateInvoiceDraftUseCase = getIt.get<UpdateInvoiceDraftUseCase>();
  final _createInvoiceUseCase = getIt.get<CreateInvoiceUseCase>();

  final _draftDebouncer = Debouncer();

  @override
  FutureOr<CreateInvoiceState> build() async {
    final appPreferences = await ref.watch(appPreferencesProvider.future);

    final selectedInvoiceDraft = ref.watch(selectedInvoiceDraftProvider);

    InvoiceDraft invoiceDraft = await switch (selectedInvoiceDraft) {
      None() => _createInvoiceDraftUseCase.exec(),
      Selected() => _findInvoiceDraftUseCase.exec(
        selectedInvoiceDraft.searchDto.id,
      ),
    };

    late DateTime date;
    if (invoiceDraft.date != null) {
      date = invoiceDraft.date!;
    } else {
      date = DateTime.now();
    }

    late CustomerDto? customer;
    if (invoiceDraft.customerId != null) {
      customer = await _findCustomerUseCase
          .exec(invoiceDraft.customerId!)
          .then(CustomerDto.fromResponse);
    } else {
      customer = null;
    }

    String? remainingUnpaidBalance = invoiceDraft.remainingUnpaidBalance
        .toString();

    Map<String, InvoiceProductDto> invoiceProducts = {};
    for (final draftProduct in invoiceDraft.products) {
      final product = await _findProductUseCase.exec(
        id: draftProduct.productId,
      );

      final invoiceProduct = InvoiceProductDto(
        product: ProductDto.fromEntity(product),
        unitPrice: draftProduct.unitPrice,
        quantity: draftProduct.quantity,
        total: draftProduct.unitPrice * draftProduct.quantity,
      );

      invoiceProducts[invoiceProduct.tempId] = invoiceProduct;
    }

    return CreateInvoiceState(
      currency: appPreferences.defaultCurrency,
      invoiceDraftId: invoiceDraft.id!,
      dateInput: Input(value: date, validationRules: {IsRequiredRule()}),
      customerInput: Input<CustomerDto>(
        value: customer,
        validationRules: {IsRequiredRule()},
      ),
      remainingUnpaidBalanceInput: Input(
        value: remainingUnpaidBalance,
        validationRules: {IsMoneyRule(appPreferences.defaultCurrency)},
      ),
      invoiceProducts: invoiceProducts,
    );
  }

  Future<void> updateDate(DateTime date) async {
    final value = await future;

    // Update the state
    state = AsyncData(
      value.copyWith(dateInput: value.dateInput.copyWith(value: date)),
    );

    // Save the draft state.
    _saveDraft();
  }

  Future<void> clearDate() async {
    final value = await future;

    // Update the state
    state = AsyncData(
      value.copyWith(dateInput: value.dateInput.copyWithoutValue()),
    );

    // Save the draft state.
    _saveDraft();
  }

  Future<void> updateCustomer(CustomerDto? dto) async {
    final value = await future;

    // Update the state
    state = AsyncData(
      value.copyWith(customerInput: value.customerInput.copyWith(value: dto)),
    );

    // Save the draft state.
    _saveDraft();
  }

  Future<void> updateRemainingUnpaidBalance(
    String? remainingUnpaidBalance,
  ) async {
    final value = await future;

    // Update the state
    state = AsyncData(
      value.copyWith(
        remainingUnpaidBalanceInput: value.remainingUnpaidBalanceInput.copyWith(
          value: remainingUnpaidBalance,
        ),
      ),
    );

    // Save the draft state
    _saveDraft();
  }

  Future<void> addInvoiceProduct(InvoiceProductDto dto) async {
    final value = await future;

    // Update the state.
    final newMap = {...value.invoiceProducts};
    newMap[dto.tempId] = dto;

    state = AsyncData(value.copyWith(invoiceProducts: newMap));

    // Save the draft state.
    _saveDraft();
  }

  int getProductAvailableStock(ProductDto dto) {
    // This method should be called only when this provider has loaded.
    final value = state.value!;

    // We need to check the stock from the selected product, and the ones we
    // have already registered.
    final int availableStock =
        dto.stock -
        value.invoiceProducts.values.fold(0, (acc, it) {
          if (it.product.id == dto.id) {
            return acc + it.quantity;
          }
          return acc;
        });

    return availableStock;
  }

  Future<void> clearProducts() async {
    final value = await future;

    // Update the state.
    state = AsyncData(value.copyWith(invoiceProducts: const {}));

    // Save the draft state.
    _saveDraft();
  }

  Future<void> deleteProduct(InvoiceProductDto invoiceProduct) async {
    final value = await future;

    final copy = {...value.invoiceProducts}..remove(invoiceProduct.tempId);

    // Update the state.
    state = AsyncData(value.copyWith(invoiceProducts: copy));

    // Save the draft state.
    _saveDraft();
  }

  Future<void> create() async {
    final value = await future;
    assert(value.isValid);

    state = AsyncData(value.copyWith(status: CreateInvoiceStatus.LOADING));

    await _createInvoiceUseCase.exec(
      CreateInvoiceRequest(
        date: value.dateInput.value!,
        customerId: value.customerInput.value!.id,
        remainingUnpaidBalance: value.currency.tryParse(
          value.remainingUnpaidBalanceInput.value,
        ),
        invoiceDraftId: value.invoiceDraftId,
        invoiceProducts: value.invoiceProducts.values.map((it) {
          return CreateInvoiceProductRequest(
            productId: it.product.id,
            unitPrice: it.unitPrice,
            quantity: it.quantity,
          );
        }).toList(),
      ),
    );

    state = AsyncData(value.copyWith(status: CreateInvoiceStatus.SUCCESS));
  }

  Future<void> _saveDraft() async {
    final value = await future;

    state = AsyncData(value.copyWith(status: CreateInvoiceStatus.SAVING_DRAFT));
    _draftDebouncer.debounce(() async {
      await _updateInvoiceDraftUseCase.exec(
        UpdateInvoiceDraftRequest(
          id: value.invoiceDraftId,
          date: value.dateInput.value,
          customerId: value.customerInput.value?.id,
          remainingUnpaidBalance: value.currency.tryParse(
            value.remainingUnpaidBalanceInput.value,
          ),
          invoiceProducts: value.invoiceProducts.values.map((it) {
            return InvoiceProduct(
              productId: it.product.id,
              unitPrice: it.unitPrice,
              quantity: it.quantity,
            );
          }),
        ),
      );
      state = AsyncData(value.copyWith(status: CreateInvoiceStatus.INITIAL));
    });

    await _draftDebouncer.completer.future;
  }
}

final createInvoiceProvider = AsyncNotifierProvider.autoDispose(
  CreateInvoiceAsyncNotifier.new,
);
