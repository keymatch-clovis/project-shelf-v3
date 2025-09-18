import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/app/entity/invoice.dart';
import 'package:project_shelf_v3/app/use_case/invoice/watch_invoices_use_case.dart';
import 'package:project_shelf_v3/main.dart';

final invoiceListProvider = StreamProvider<List<Invoice>>((ref) {
  final useCase = getIt.get<WatchInvoicesUseCase>();

  return useCase.exec();
});
