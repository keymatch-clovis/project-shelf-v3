import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/common/object_input.dart';
import 'package:project_shelf_v3/adapter/common/validator/object_validator.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/app/use_case/invoice/create_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/main.dart';

part "create_invoice_provider.freezed.dart";

/// State related
enum CreateInvoiceStatus { INITIAL, LOADING, SAVING, SUCCESS }

@freezed
abstract class CreateInvoiceState with _$CreateInvoiceState {
  const factory CreateInvoiceState({
    @Default(CreateInvoiceStatus.INITIAL) CreateInvoiceStatus status,
    required ObjectInput<CustomerDto> customerInput,
  }) = _CreateInvoiceState;

  const CreateInvoiceState._();

  bool get isVaild => false;
}

/// Provider related
final class CreateInvoiceNotifier extends Notifier<CreateInvoiceState> {
  final _createInvoiceDraftUseCase = getIt.get<CreateInvoiceDraftUseCase>();

  @override
  CreateInvoiceState build() {
    return CreateInvoiceState(
      customerInput: ObjectInput<CustomerDto>(
        ObjectValidator(isRequired: true),
      ),
    );
  }

  void updateCustomer(CustomerDto? dto) {
    state = state.copyWith(
      customerInput: state.customerInput.copyWith(value: dto),
    );
  }
}

final createInvoiceProvider = NotifierProvider(CreateInvoiceNotifier.new);
