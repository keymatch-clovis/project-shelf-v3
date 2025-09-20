import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_draft_dto.dart';

/// State related
enum SelectedInvoiceDraftStatus { INITIAL, LOADING, DELETED }

sealed class SelectedInvoiceDraftState {
  final SelectedInvoiceDraftStatus status;

  SelectedInvoiceDraftState({SelectedInvoiceDraftStatus? status})
    : status = status ?? SelectedInvoiceDraftStatus.INITIAL;
}

final class None extends SelectedInvoiceDraftState {}

final class Selected extends SelectedInvoiceDraftState {
  final InvoiceDraftDto dto;

  Selected({required this.dto, super.status});

  Selected copyWith({
    InvoiceDraftDto? dto,
    SelectedInvoiceDraftStatus? status,
  }) {
    return Selected(dto: dto ?? this.dto, status: status ?? this.status);
  }
}

/// Provider related
final class SelectedInvoiceDraftNotifier
    extends Notifier<SelectedInvoiceDraftState> {
  @override
  SelectedInvoiceDraftState build() {
    return None();
  }

  void select(InvoiceDraftDto dto) {
    state = Selected(dto: dto);
  }
}

final selectedInvoiceDraftProvider = NotifierProvider(
  SelectedInvoiceDraftNotifier.new,
);
