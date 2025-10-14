import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/dto/print_invoice_request.dart';
import 'package:project_shelf_v3/app/dto/printer_info_response.dart';

abstract interface class PrinterService {
  Future<Iterable<PrinterDataResponse>> getPrinters();

  Future<Result> printInvoice(PrintInvoiceRequest invoiceRequest);
}
