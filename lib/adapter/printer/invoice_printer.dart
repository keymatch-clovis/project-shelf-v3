import 'package:project_shelf_v3/app/dto/customer_response.dart';
import 'package:project_shelf_v3/app/dto/invoice_product_response.dart';
import 'package:project_shelf_v3/app/dto/invoice_response.dart';

final class PrintArgs {
  final InvoiceResponse invoice;
  final CustomerResponse customer;
  final Iterable<InvoiceProductResponse> invoiceProducts;

  const PrintArgs({
    required this.invoice,
    required this.customer,
    required this.invoiceProducts,
  });
}

abstract interface class InvoicePrinter {
  Future<void> print(PrintArgs args);
}
