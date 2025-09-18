import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/repository/invoice_repository.dart';
import 'package:project_shelf_v3/app/entity/invoice.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart' as service;
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/main.dart';

final class InvoiceServiceImpl implements service.InvoiceService {
  final _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<InvoiceRepository>();

  @override
  Stream<List<Invoice>> watch() {
    _logger.d("Watching invoices");
    return _repository.watch().map((it) {
      return it.map((it) => it.toEntity()).toList();
    });
  }
}
