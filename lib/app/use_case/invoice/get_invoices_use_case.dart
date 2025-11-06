import 'package:injectable/injectable.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/domain/service/invoice_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/injectable.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
final class GetInvoicesUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<InvoiceService>();

  Stream<Iterable<Invoice>> exec() {
    _logger.d('Getting invoices');
    return _service.get();
  }
}
