import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_draft_dto.dart';
import 'package:project_shelf_v3/app/use_case/invoice/get_invoice_drafts_use_case.dart';
import 'package:project_shelf_v3/main.dart';

final invoiceDraftItemsProvider =
    FutureProvider.autoDispose<List<InvoiceDraftDto>>((ref) {
      final useCase = getIt.get<GetInvoiceDraftsUseCase>();

      return useCase.exec().then(
        (it) => it.map(InvoiceDraftDto.fromEntity).toList(),
      );
    });
