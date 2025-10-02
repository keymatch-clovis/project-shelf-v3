import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_query_result_dto.dart';

// State related
enum SelectedInvoiceStatus { INITIAL, LOADING, DELETED }

sealed class SelectedInvoiceState {
  final SelectedInvoiceStatus status;

  const SelectedInvoiceState({this.status = SelectedInvoiceStatus.INITIAL});
}

final class None extends SelectedInvoiceState {}

final class Selected extends SelectedInvoiceState {
  final InvoiceQueryResultDto queryResult;

  const Selected(this.queryResult, {super.status});

  Selected copyWith({
    InvoiceQueryResultDto? queryResult,
    SelectedInvoiceStatus? status,
  }) {
    return Selected(
      queryResult ?? this.queryResult,
      status: status ?? this.status,
    );
  }
}

// Provider related
final class SelectedInvoiceNotifier extends Notifier<SelectedInvoiceState> {
  @override
  SelectedInvoiceState build() {
    return None();
  }

  void select(InvoiceQueryResultDto queryResult) {
    state = Selected(queryResult);
  }
}

final selectedInvoiceProvider = NotifierProvider(SelectedInvoiceNotifier.new);
