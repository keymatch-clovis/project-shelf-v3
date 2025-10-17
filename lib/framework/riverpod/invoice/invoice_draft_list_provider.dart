import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_draft_search_dto.dart';
import 'package:project_shelf_v3/app/use_case/invoice/delete_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/invoice_draft_items_provider.dart';
import 'package:project_shelf_v3/injectable.dart';

part "invoice_draft_list_provider.freezed.dart";

enum InvoiceDraftListMode { LIST, SELECT }

@freezed
abstract class InvoiceDraftListState with _$InvoiceDraftListState {
  factory InvoiceDraftListState({
    @Default(InvoiceDraftListMode.LIST) InvoiceDraftListMode mode,
    @Default(<InvoiceDraftSearchDto>{}) Set<InvoiceDraftSearchDto> selected,
    required AsyncValue<List<InvoiceDraftSearchDto>> items,
  }) = _InvoiceDraftListState;
}

final class InvoiceDraftListNotifier extends Notifier<InvoiceDraftListState> {
  final _deleteInvoiceDraftUseCase = getIt.get<DeleteInvoiceDraftUseCase>();

  @override
  InvoiceDraftListState build() {
    return InvoiceDraftListState(items: ref.watch(invoiceDraftItemsProvider));
  }

  void setMode(InvoiceDraftListMode mode) {
    if (mode == InvoiceDraftListMode.LIST) {
      state = state.copyWith(selected: {});
    }
    state = state.copyWith(mode: mode);
  }

  void selectAll() {
    state = state.copyWith(
      selected: {...state.items.value!},
      mode: InvoiceDraftListMode.SELECT,
    );
  }

  void select(InvoiceDraftSearchDto dto) {
    state = state.copyWith(
      selected: {...state.selected, dto},
      mode: InvoiceDraftListMode.SELECT,
    );
  }

  void deselect(InvoiceDraftSearchDto dto) {
    state = state.copyWith(selected: {...state.selected}..remove(dto));
  }

  void deselectAll() {
    state = state.copyWith(selected: {});
  }

  Future<void> deleteSelected() async {
    for (final product in state.selected) {
      await _deleteInvoiceDraftUseCase.exec(product.id);
    }

    ref.invalidate(invoiceDraftItemsProvider);
  }
}

final invoiceDraftListProvider = NotifierProvider.autoDispose(
  InvoiceDraftListNotifier.new,
);
