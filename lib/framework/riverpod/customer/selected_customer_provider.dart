import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/app/use_case/customer/delete_customer_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

/// State related
enum SelectedCustomerStatus { INITIAL, LOADING, DELETED }

sealed class SelectedCustomerState {
  final SelectedCustomerStatus status;

  const SelectedCustomerState({SelectedCustomerStatus? status})
    : status = status ?? SelectedCustomerStatus.INITIAL;
}

final class NoneState extends SelectedCustomerState {}

final class SelectedState extends SelectedCustomerState {
  final CustomerDto customer;

  const SelectedState({required this.customer, super.status});

  SelectedState copyWith({CustomerDto? customer, SelectedCustomerStatus? status}) {
    return SelectedState(
      customer: customer ?? this.customer,
      status: status ?? this.status,
    );
  }
}

/// Provider related
final class SelectedCustomerNotifier extends Notifier<SelectedCustomerState> {
  final _deleteCustomerUseCase = getIt.get<DeleteCustomerUseCase>();

  @override
  SelectedCustomerState build() {
    return NoneState();
  }

  void select(CustomerDto customer) {
    state = SelectedState(customer: customer);
  }

  Future<void> delete() async {
    assert(state is SelectedState);

    final selected = state as SelectedState;

    state = (selected).copyWith(status: SelectedCustomerStatus.LOADING);

    await _deleteCustomerUseCase.exec(selected.customer.id);

    state = (selected).copyWith(status: SelectedCustomerStatus.DELETED);
  }
}

final selectedCustomerProvider = NotifierProvider(SelectedCustomerNotifier.new);
