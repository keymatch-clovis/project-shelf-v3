import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_draft_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_product_dto.dart';
import 'package:project_shelf_v3/app/dto/update_invoice_draft_request.dart';
import 'package:project_shelf_v3/app/use_case/invoice/create_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/find_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/app/use_case/invoice/update_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/selected_invoice_draft_provider.dart';
import 'package:project_shelf_v3/main.dart';

part "create_invoice_draft_provider.freezed.dart";

/// State related
enum CreateInvoiceDraftStatus { INITIAL, LOADING, SUCCESS }

@freezed
abstract class CreateInvoiceDraftState with _$CreateInvoiceDraftState {
  const factory CreateInvoiceDraftState({
    required CreateInvoiceDraftStatus status,
    required Id invoiceDraftId,
    DateTime? date,
    Id? customerId,
    @Default([]) List<InvoiceProductDto> invoiceProducts,
  }) = _CreateInvoiceDraftState;
}

/// Provider related
final class CreateInvoiceDraftNotifier
    extends AsyncNotifier<CreateInvoiceDraftState> {
  final _findInvoiceDraftUseCase = getIt.get<FindInvoiceDraftUseCase>();
  final _createInvoiceDraftUseCase = getIt.get<CreateInvoiceDraftUseCase>();
  final _updateInvoiceDraftUseCase = getIt.get<UpdateInvoiceDraftUseCase>();

  @override
  FutureOr<CreateInvoiceDraftState> build() async {
    // We are consuming the selected invoice draft provider. As such we do not
    // watch it.
    final selectedInvoiceDraft = ref.read(selectedInvoiceDraftProvider);

    InvoiceDraftDto invoiceDraft = await switch (selectedInvoiceDraft) {
      None() => _createInvoiceDraftUseCase.exec(),
      Selected() => _findInvoiceDraftUseCase.exec(
        selectedInvoiceDraft.searchDto.id,
      ),
    }.then((it) => InvoiceDraftDto.fromEntity(it));

    // Once we have consumed the selected invoice, we need to clear the
    // selection, so other instances of the app wont use the same selection.
    ref.read(selectedInvoiceDraftProvider.notifier).clear();

    return CreateInvoiceDraftState(
      status: CreateInvoiceDraftStatus.INITIAL,
      invoiceDraftId: invoiceDraft.id,
      date: invoiceDraft.date,
      customerId: invoiceDraft.customerId,
    );
  }

  Future<void> updateDate(DateTime? date) async {
    final value = await future;

    state = AsyncData(value.copyWith(date: date));
  }

  Future<void> updateCustomerId(Id? id) async {
    final value = await future;

    state = AsyncData(value.copyWith(customerId: id));
  }

  Future<void> addInvoiceProduct(InvoiceProductDto dto) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(invoiceProducts: [...value.invoiceProducts, dto]),
    );
  }

  Future<void> save() async {
    final value = await future;

    state = AsyncData(value.copyWith(status: CreateInvoiceDraftStatus.LOADING));

    await _updateInvoiceDraftUseCase.exec(
      UpdateInvoiceDraftRequest(
        id: value.invoiceDraftId,
        date: value.date,
        customerId: value.customerId,
        invoiceProducts: value.invoiceProducts.map((it) => it.toEntity()),
      ),
    );

    state = AsyncData(value.copyWith(status: CreateInvoiceDraftStatus.INITIAL));
  }
}

final createInvoiceDraftProvider = AsyncNotifierProvider.autoDispose(
  CreateInvoiceDraftNotifier.new,
);
