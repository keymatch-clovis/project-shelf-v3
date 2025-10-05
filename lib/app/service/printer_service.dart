import 'package:project_shelf_v3/app/dto/print_invoice_request.dart';
import 'package:project_shelf_v3/app/dto/printer_data_request.dart';
import 'package:project_shelf_v3/app/dto/printer_info_response.dart';

abstract interface class PrinterService {
  Future<Iterable<PrinterDataResponse>> getPrinters();

  Future<void> printInvoice({
    required PrintInvoiceRequest invoiceRequest,
    required PrinterDataRequest printerRequest,
  });
}
