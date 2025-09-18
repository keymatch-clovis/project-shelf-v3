import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/app/entity/customer.dart';
import 'package:project_shelf_v3/app/use_case/customer/delete_customer_use_case.dart';
import 'package:project_shelf_v3/main.dart';

/// State related
enum SelectedCustomerStatus { INITIAL, LOADING, DELETED }

sealed class SelectedCustomerState {
  final SelectedCustomerStatus status;

  const SelectedCustomerState({SelectedCustomerStatus? status})
    : status = status ?? SelectedCustomerStatus.INITIAL;
}

final class None extends SelectedCustomerState {}

final class Selected extends SelectedCustomerState {
  final Customer customer;

  const Selected({required this.customer, super.status});

  Selected copyWith({Customer? customer, SelectedCustomerStatus? status}) {
    return Selected(
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
    return None();
  }

  void select(Customer customer) {
    state = Selected(customer: customer);
  }

  Future<void> delete() async {
    assert(state is Selected);

    final selected = state as Selected;

    state = (selected).copyWith(status: SelectedCustomerStatus.LOADING);

    await _deleteCustomerUseCase.exec(selected.customer.id);

    state = (selected).copyWith(status: SelectedCustomerStatus.DELETED);
  }
}

final selectedCustomerProvider = NotifierProvider(SelectedCustomerNotifier.new);
