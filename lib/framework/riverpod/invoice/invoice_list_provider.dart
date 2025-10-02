import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_query_result_dto.dart';
import 'package:project_shelf_v3/app/use_case/invoice/watch_invoices_use_case.dart';
import 'package:project_shelf_v3/main.dart';

final invoiceListProvider =
    StreamProvider.autoDispose<List<InvoiceQueryResultDto>>((ref) {
      final useCase = getIt.get<WatchInvoicesUseCase>();

      return useCase.exec().map((it) {
        return it.map((it) {
          return InvoiceQueryResultDto(
            id: it.$1.id,
            number: it.$1.number,
            date: it.$1.date,
            customer: CustomerDto.fromResponse(it.$2),
          );
        }).toList();
      });
    });
