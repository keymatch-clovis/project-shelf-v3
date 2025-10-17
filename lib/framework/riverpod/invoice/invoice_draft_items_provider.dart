import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_draft_search_dto.dart';
import 'package:project_shelf_v3/app/use_case/invoice/get_invoice_drafts_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

final invoiceDraftItemsProvider =
    FutureProvider.autoDispose<List<InvoiceDraftSearchDto>>((ref) {
      final useCase = getIt.get<GetInvoiceDraftsUseCase>();

      return useCase.exec().then(
        (it) => it.map(InvoiceDraftSearchDto.fromEntity).toList(),
      );
    });
