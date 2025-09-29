import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_required_rule.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_product_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/app/dto/update_invoice_draft_request.dart';
import 'package:project_shelf_v3/app/use_case/customer/find_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/create_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/find_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/update_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/find_product_use_case.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/domain/entity/invoice_draft.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/invoice_product_form_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/selected_invoice_draft_provider.dart';
import 'package:project_shelf_v3/main.dart';

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
    required Input customerInput,
    required List<InvoiceProductDto> invoiceProducts,
  }) = _CreateInvoiceState;

  const CreateInvoiceState._();

  bool get isVaild => false;

  Money get totalValue {
    return invoiceProducts.fold(Money.fromNumWithCurrency(0, currency), (
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
          .then(CustomerDto.fromEntity);
    } else {
      customer = null;
    }

    List<InvoiceProductDto> invoiceProducts = [];
    for (final draftProduct in invoiceDraft.products) {
      final product = await _findProductUseCase.exec(
        id: draftProduct.productId,
      );

      invoiceProducts.add(
        InvoiceProductDto(
          product: ProductDto.fromEntity(product),
          unitPrice: draftProduct.unitPrice,
          quantity: draftProduct.quantity,
          total: draftProduct.unitPrice * draftProduct.quantity,
        ),
      );
    }

    return CreateInvoiceState(
      currency: appPreferences.defaultCurrency,
      invoiceDraftId: invoiceDraft.id!,
      dateInput: Input(value: date, validationRules: {IsRequiredRule()}),
      customerInput: Input<CustomerDto>(
        value: customer,
        validationRules: {IsRequiredRule()},
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

  Future<void> addInvoiceProduct(InvoiceProductDto dto) async {
    final value = await future;

    // Update the state.
    state = AsyncData(
      value.copyWith(invoiceProducts: [...value.invoiceProducts, dto]),
    );

    // Save the draft state.
    _saveDraft();
  }

  Future<int> getCurrentProductQuantity(Id productId) async {
    final value = await future;

    final result = value.invoiceProducts.fold(0, (acc, it) {
      if (it.product.id == productId) {
        return acc + it.quantity;
      }
      return acc;
    });
    // I hate this language. :3
    return result;
  }

  Future<void> clearProducts() async {
    final value = await future;

    // Update the state.
    state = AsyncData(value.copyWith(invoiceProducts: []));

    // Save the draft state.
    _saveDraft();
  }

  Future<void> editInvoiceProduct({
    required int index,
    required InvoiceProductDto invoiceProduct,
  }) async {
    final currentStock = await getCurrentProductQuantity(
      invoiceProduct.product.id,
    ).then((it) => invoiceProduct.product.stock - it);

    await ref
        .read(invoiceProductFormProvider.notifier)
        .setForm(
          invoiceProduct: invoiceProduct,
          index: index,
          currentStock: currentStock,
        );
  }

  Future<void> clearInvoiceProductForm() async {
      print("clearing");
    await ref.read(invoiceProductFormProvider.notifier).clearForm();
  }

  Future<void> _saveDraft() async {
    final value = await future;

    state = AsyncData(value.copyWith(status: CreateInvoiceStatus.SAVING_DRAFT));

    await _updateInvoiceDraftUseCase.exec(
      UpdateInvoiceDraftRequest(
        id: value.invoiceDraftId,
        date: value.dateInput.value,
        customerId: value.customerInput.value?.id,
        invoiceProducts: value.invoiceProducts.map((it) {
          return InvoiceProduct(
            productId: it.product.id,
            unitPrice: it.unitPrice,
            quantity: it.quantity,
          );
        }),
      ),
    );

    state = AsyncData(value.copyWith(status: CreateInvoiceStatus.INITIAL));
  }
}

final createInvoiceProvider = AsyncNotifierProvider.autoDispose(
  CreateInvoiceAsyncNotifier.new,
);
