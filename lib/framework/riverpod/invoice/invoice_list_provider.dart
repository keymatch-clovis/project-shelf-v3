import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_dto.dart';
import 'package:project_shelf_v3/app/use_case/invoice/watch_invoices_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

final invoiceListProvider = StreamProvider.autoDispose<Iterable<InvoiceDto>>((
  ref,
) {
  final useCase = getIt.get<WatchInvoicesUseCase>();

  return useCase.exec().map((it) {
    return it.map((it) {
      return InvoiceDto.fromResponse(invoice: it.$1, customer: it.$2);
    });
  });
});
