import 'package:project_shelf_v3/app/dto/print_invoice_request.dart';

abstract interface class InvoicePrinter {
  Future<void> print(PrintInvoiceRequest request);
}
