import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/common/object_input.dart';
import 'package:project_shelf_v3/adapter/common/validator/object_validator.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_product_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/create_invoice_draft_provider.dart';

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
  @override
  FutureOr<CreateInvoiceState> build() async {
    final invoiceDraft = await ref.watch(
      createInvoiceDraftProvider.selectAsync((it) => it.invoiceDraft),
    );

    // When creating a new invoice, set the default values for the draft after
    // it has been created or loaded.
    final date = DateTime.now();
    await ref.read(createInvoiceDraftProvider.notifier).updateDate(date);

    return CreateInvoiceState(
      dateInput: ObjectInput<DateTime>(
        ObjectValidator(isRequired: true),
        value: date,
      ),
      customerInput: ObjectInput<CustomerDto>(
        ObjectValidator(isRequired: true),
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
    ref.read(createInvoiceDraftProvider.notifier).updateDate(date);
  }

  Future<void> updateCustomer(CustomerDto? dto) async {
    final value = await future;

    // Update the state
    state = AsyncData(
      value.copyWith(customerInput: value.customerInput.copyWith(value: dto)),
    );

    // Update the draft state
    ref.read(createInvoiceDraftProvider.notifier).updateCustomerId(dto?.id);
  }

  Future<void> addInvoiceProduct(InvoiceProductDto dto) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(invoiceProducts: [...value.invoiceProducts, dto]),
    );
  }
}

final createInvoiceProvider = AsyncNotifierProvider.autoDispose(
  CreateInvoiceAsyncNotifier.new,
);
