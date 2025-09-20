import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_draft_dto.dart';
import 'package:project_shelf_v3/app/use_case/invoice/create_invoice_draft_use_case.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/selected_invoice_draft_provider.dart';
import 'package:project_shelf_v3/main.dart';

part "create_invoice_draft_provider.freezed.dart";

/// State related
@freezed
abstract class CreateInvoiceDraftState with _$CreateInvoiceDraftState {
  const factory CreateInvoiceDraftState({required InvoiceDraftDto dto}) =
      _CreateInvoiceDraftState;
}

/// Provider related
final class CreateInvoiceDraftNotifier
    extends AsyncNotifier<CreateInvoiceDraftState> {
  final _createInvoiceDraftUseCase = getIt.get<CreateInvoiceDraftUseCase>();

  @override
  FutureOr<CreateInvoiceDraftState> build() {
    final selectedInvoiceDraftState = ref.watch(selectedInvoiceDraftProvider);

    return CreateInvoiceDraftState(dto: null);
  }
}

final createInvoiceDraftProvider = AsyncNotifierProvider.autoDispose(
  CreateInvoiceDraftNotifier.new,
);
