import 'dart:typed_data';

import 'package:project_shelf_v3/app/dto/printer_info_request.dart';

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
  });
}
