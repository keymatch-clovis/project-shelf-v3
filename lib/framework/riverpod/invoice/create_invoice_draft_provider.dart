import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_draft_dto.dart';
import 'package:project_shelf_v3/app/dto/update_invoice_draft_request.dart';
import 'package:project_shelf_v3/app/use_case/invoice/create_invoice_draft_use_case.dart';
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
    required InvoiceDraftDto invoiceDraft,
    DateTime? date,
    Id? customerId,
  }) = _CreateInvoiceDraftState;
}

/// Provider related
final class CreateInvoiceDraftNotifier
    extends AsyncNotifier<CreateInvoiceDraftState> {
  final _createInvoiceDraftUseCase = getIt.get<CreateInvoiceDraftUseCase>();
  final _updateInvoiceDraftUseCase = getIt.get<UpdateInvoiceDraftUseCase>();

  @override
  FutureOr<CreateInvoiceDraftState> build() async {
    final selectedInvoiceDraft = ref.watch(selectedInvoiceDraftProvider);

    if (selectedInvoiceDraft is Selected) {
      throw UnimplementedError();
    }

    final invoiceDraftDto = await _createInvoiceDraftUseCase.exec().then(
      InvoiceDraftDto.fromEntity,
    );

    return CreateInvoiceDraftState(
      status: CreateInvoiceDraftStatus.INITIAL,
      invoiceDraft: invoiceDraftDto,
    );
  }

  Future<void> updateDate(DateTime? date) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(status: CreateInvoiceDraftStatus.LOADING, date: date),
    );
    _updateInvoiceDraft();
  }

  Future<void> updateCustomerId(Id? id) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(status: CreateInvoiceDraftStatus.LOADING, customerId: id),
    );
    _updateInvoiceDraft();
  }

  Future<void> _updateInvoiceDraft() async {
    final value = await future;

    await _updateInvoiceDraftUseCase.exec(
      UpdateInvoiceDraftRequest(id: value.invoiceDraft.id, date: value.date),
    );

    state = AsyncData(value.copyWith(status: CreateInvoiceDraftStatus.INITIAL));
  }
}

final createInvoiceDraftProvider = AsyncNotifierProvider.autoDispose(
  CreateInvoiceDraftNotifier.new,
);
