import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/common/object_input.dart';
import 'package:project_shelf_v3/adapter/common/validator/object_validator.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

part "create_invoice_provider.freezed.dart";

/// State related
enum CreateInvoiceStatus { INITIAL, LOADING, SAVING, SUCCESS }

@freezed
abstract class CreateInvoiceState with _$CreateInvoiceState {
  const factory CreateInvoiceState({
    @Default(CreateInvoiceStatus.INITIAL) CreateInvoiceStatus status,
    required ObjectInput<CustomerDto> customerInput,

    Id? invoiceDraftId,
  }) = _CreateInvoiceState;

  const CreateInvoiceState._();

  bool get isVaild => false;
}

/// Provider related
final class CreateInvoiceAsyncNotifier
    extends AsyncNotifier<CreateInvoiceState> {
  @override
  FutureOr<CreateInvoiceState> build() async {
    await Future.delayed(Duration(seconds: 1));

    return CreateInvoiceState(
      customerInput: ObjectInput<CustomerDto>(
        ObjectValidator(isRequired: true),
      ),
    );
  }

  void updateCustomer(CustomerDto? dto) {}
}

final createInvoiceProvider = AsyncNotifierProvider.autoDispose(
  CreateInvoiceAsyncNotifier.new,
);
