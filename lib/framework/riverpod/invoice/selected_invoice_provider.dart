import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

// State related
enum SelectedInvoiceStatus { INITIAL, LOADING, DELETED }

sealed class SelectedInvoiceState {
  final SelectedInvoiceStatus status;

  const SelectedInvoiceState({this.status = SelectedInvoiceStatus.INITIAL});
}

final class NoneState extends SelectedInvoiceState {}

final class SelectedState extends SelectedInvoiceState {
  final Id invoiceId;

  const SelectedState(this.invoiceId, {super.status});

  SelectedState copyWith({Id? invoiceId, SelectedInvoiceStatus? status}) {
    return SelectedState(invoiceId ?? this.invoiceId, status: status ?? this.status);
  }
}

// Provider related
final class SelectedInvoiceNotifier extends Notifier<SelectedInvoiceState> {
  @override
  SelectedInvoiceState build() {
    return NoneState();
  }

  void select(Id invoiceId) {
    state = SelectedState(invoiceId);
  }
}

final selectedInvoiceProvider = NotifierProvider(SelectedInvoiceNotifier.new);
