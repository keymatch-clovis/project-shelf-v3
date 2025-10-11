import 'dart:typed_data';

import 'package:project_shelf_v3/app/dto/printer_info_request.dart';

final class InvoiceProductPrintRequest {
  final String name;
  final String unitPrice;
  final String quantity;
  final String total;

  const InvoiceProductPrintRequest({
    required this.name,
    required this.unitPrice,
    required this.quantity,
    required this.total,
  });
}

final class PrintInvoiceRequest {
  final PrinterInfoRequest printerInfoRequest;
  final Uint8List invoiceLogoBytes;
  final String companyDocument;
  final String companyPhone;
  final String companyEmail;
  final String invoiceCustomer;
  final String invoiceCity;
  final String invoiceDate;
  final String totalValue;
  final Iterable<InvoiceProductPrintRequest> invoiceProducts;
  final String? remainingUnpaidBalance;

  const PrintInvoiceRequest({
    required this.invoiceLogoBytes,
    required this.companyDocument,
    required this.companyPhone,
    required this.companyEmail,
    required this.invoiceCustomer,
    required this.invoiceCity,
    required this.invoiceDate,
    required this.printerInfoRequest,
    required this.totalValue,
    required this.invoiceProducts,
    this.remainingUnpaidBalance,
  });
}
