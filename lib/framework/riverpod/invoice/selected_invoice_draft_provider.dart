import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_draft_search_dto.dart';

/// State related
enum SelectedInvoiceDraftStatus { INITIAL, LOADING, DELETED }

sealed class SelectedInvoiceDraftState {
  final SelectedInvoiceDraftStatus status;

  SelectedInvoiceDraftState({SelectedInvoiceDraftStatus? status})
    : status = status ?? SelectedInvoiceDraftStatus.INITIAL;
}

final class NoneState extends SelectedInvoiceDraftState {}

final class SelectedState extends SelectedInvoiceDraftState {
  final InvoiceDraftSearchDto searchDto;

  SelectedState({required this.searchDto, super.status});

  SelectedState copyWith({
    InvoiceDraftSearchDto? searchDto,
    SelectedInvoiceDraftStatus? status,
  }) {
    return SelectedState(
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
    return NoneState();
  }

  void select(InvoiceDraftSearchDto dto) {
    state = SelectedState(searchDto: dto);
  }

  void clear() {
    state = NoneState();
  }
}

final selectedInvoiceDraftProvider = NotifierProvider(
  SelectedInvoiceDraftNotifier.new,
);
