import 'package:logger/web.dart';
import 'package:project_shelf_v3/app/dto/invoice_with_customer_response.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/main.dart';

final class WatchInvoicesUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<InvoiceService>();

  Stream<List<InvoiceWithCustomerResponse>> exec() {
    _logger.d("Watching invoices");
    return _service.watch();
  }
}
