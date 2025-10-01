import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_dto.dart';

// State related
enum SelectedInvoiceStatus { INITIAL, LOADING, DELETED }

sealed class SelectedInvoiceState {
  final SelectedInvoiceStatus status;

  const SelectedInvoiceState({this.status = SelectedInvoiceStatus.INITIAL});
}

final class None extends SelectedInvoiceState {}

final class Selected extends SelectedInvoiceState {
  final InvoiceDto invoice;

  const Selected(this.invoice, {super.status});

  Selected copyWith({InvoiceDto? invoice, SelectedInvoiceStatus? status}) {
    return Selected(invoice ?? this.invoice, status: status ?? this.status);
  }
}

// Provider related
final class SelectedInvoiceNotifier extends Notifier<SelectedInvoiceState> {
  @override
  SelectedInvoiceState build() {
    return None();
  }

  void select(InvoiceDto invoice) {
    state = Selected(invoice);
  }
}

final selectedInvoiceProvider = NotifierProvider(SelectedInvoiceNotifier.new);
