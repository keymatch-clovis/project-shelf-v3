import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/dto/print_invoice_request.dart';
import 'package:project_shelf_v3/app/dto/printer_data_request.dart';
import 'package:project_shelf_v3/app/service/printer_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/main.dart';

final class PrintInvoiceUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _printerService = getIt.get<PrinterService>();

  Future<void> exec({
    required Id invoiceId,
    required PrinterDataRequest printerRequest,
  }) async {
    _logger.d('Printing invoice');
    _printerService.printInvoice(
      invoiceRequest: PrintInvoiceRequest(),
      printerRequest: printerRequest,
    );
  }
}
