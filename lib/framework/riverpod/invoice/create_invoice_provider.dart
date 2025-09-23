import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/common/object_input.dart';
import 'package:project_shelf_v3/adapter/common/validator/object_validator.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_product_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/app/use_case/customer/find_customer_use_case.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/create_invoice_draft_provider.dart';
import 'package:project_shelf_v3/main.dart';

part "create_invoice_provider.freezed.dart";

/// State related

enum CreateInvoiceStatus { INITIAL, LOADING, SUCCESS }

@freezed
abstract class CreateInvoiceState with _$CreateInvoiceState {
  const factory CreateInvoiceState({
    @Default(CreateInvoiceStatus.INITIAL) CreateInvoiceStatus status,
    required ObjectInput<DateTime> dateInput,
    required ObjectInput<CustomerDto> customerInput,
    required List<InvoiceProductDto> invoiceProducts,
  }) = _CreateInvoiceState;

  const CreateInvoiceState._();

  bool get isVaild => false;
}

/// Provider related
final class CreateInvoiceAsyncNotifier
    extends AsyncNotifier<CreateInvoiceState> {
  final _findCustomerUseCase = getIt.get<FindCustomerUseCase>();

  @override
  FutureOr<CreateInvoiceState> build() async {
    // Wait for the invoice draft to be created or fetched from storage. After
    // this, we will just read once the whole state. We need to make this
    // distintion, as if we change the invoice draft as a whole, this provider
    // will also change.
    await ref.watch(
      createInvoiceDraftProvider.selectAsync((it) => it.invoiceDraftId),
    );
    final draftState = ref.read(createInvoiceDraftProvider).value!;

    late DateTime date;
    if (draftState.date != null) {
      date = draftState.date!;
    } else {
      date = DateTime.now();
      await ref.read(createInvoiceDraftProvider.notifier).updateDate(date);
    }

    late CustomerDto? customer;
    if (draftState.customerId != null) {
      customer = await _findCustomerUseCase
          .exec(draftState.customerId!)
          .then(CustomerDto.fromEntity);
    } else {
      customer = null;
    }

    return CreateInvoiceState(
      dateInput: ObjectInput<DateTime>(
        ObjectValidator(isRequired: true),
        value: date,
      ),
      customerInput: ObjectInput<CustomerDto>(
        ObjectValidator(isRequired: true),
        value: customer,
      ),
      invoiceProducts: const [],
    );
  }

  Future<void> updateDate(DateTime? date) async {
    final value = await future;

    // Update the state
    state = AsyncData(
      value.copyWith(dateInput: value.dateInput.copyWith(value: date)),
    );

    // Update the draft state
    await ref.read(createInvoiceDraftProvider.notifier).updateDate(date);
    await ref.read(createInvoiceDraftProvider.notifier).save();
  }

  Future<void> updateCustomer(CustomerDto? dto) async {
    final value = await future;

    // Update the state
    state = AsyncData(
      value.copyWith(customerInput: value.customerInput.copyWith(value: dto)),
    );

    // Update the draft state
    await ref
        .read(createInvoiceDraftProvider.notifier)
        .updateCustomerId(dto?.id);
    await ref.read(createInvoiceDraftProvider.notifier).save();
  }

  Future<void> addInvoiceProduct(InvoiceProductDto dto) async {
    final value = await future;

    // Update the state.
    state = AsyncData(
      value.copyWith(invoiceProducts: [...value.invoiceProducts, dto]),
    );

    // Update the draft state.
    await ref.read(createInvoiceDraftProvider.notifier).addInvoiceProduct(dto);
    await ref.read(createInvoiceDraftProvider.notifier).save();
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
}

final createInvoiceProvider = AsyncNotifierProvider.autoDispose(
  CreateInvoiceAsyncNotifier.new,
);
