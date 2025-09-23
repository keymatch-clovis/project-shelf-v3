import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_draft_search_dto.dart';

/// State related
enum SelectedInvoiceDraftStatus { INITIAL, LOADING, DELETED }

sealed class SelectedInvoiceDraftState {
  final SelectedInvoiceDraftStatus status;

  SelectedInvoiceDraftState({SelectedInvoiceDraftStatus? status})
    : status = status ?? SelectedInvoiceDraftStatus.INITIAL;
}

final class None extends SelectedInvoiceDraftState {}

final class Selected extends SelectedInvoiceDraftState {
  final InvoiceDraftSearchDto searchDto;

  Selected({required this.searchDto, super.status});

  Selected copyWith({
    InvoiceDraftSearchDto? searchDto,
    SelectedInvoiceDraftStatus? status,
  }) {
    return Selected(
      searchDto: searchDto ?? this.searchDto,
      status: status ?? this.status,
    );
  }
}

/// Provider related
final class SelectedInvoiceDraftNotifier
    extends Notifier<SelectedInvoiceDraftState> {
  @override
  SelectedInvoiceDraftState build() {
    return None();
  }

  void select(InvoiceDraftSearchDto dto) {
    state = Selected(searchDto: dto);
  }

  void clear() {
    state = None();
  }
}

final selectedInvoiceDraftProvider = NotifierProvider(
  SelectedInvoiceDraftNotifier.new,
);
