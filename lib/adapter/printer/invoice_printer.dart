import 'package:image/image.dart';
import 'package:project_shelf_v3/adapter/dto/repository/printer_info_dto.dart';

final class PrintArgs {
  final PrinterInfoDto printerInfo;
  final Image invoiceLogo;
  final String invoiceDocument;
  final String invoicePhone;
  final String invoiceEmail;
  final String invoiceCustomer;
  final String invoiceCity;
  final String invoiceDate;
  final String totalValue;

  const PrintArgs({
    required this.invoiceLogo,
    required this.invoiceDocument,
    required this.invoicePhone,
    required this.invoiceEmail,
    required this.invoiceCustomer,
    required this.invoiceCity,
    required this.invoiceDate,
    required this.printerInfo,
  });
}

abstract interface class InvoicePrinter {
  Future<void> print(PrintArgs args);
}
