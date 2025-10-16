import 'package:money2/money2.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class CreateInvoiceProductRequest {
  final Id productId;
  final Money unitPrice;
  final int quantity;

  const CreateInvoiceProductRequest({
    required this.productId,
    required this.unitPrice,
    required this.quantity,
  });
}

final class CreateInvoiceRequest {
  final DateTime date;
  final Id customerId;
  final List<CreateInvoiceProductRequest> invoiceProducts;
  final Id invoiceDraftId;
  final Money? remainingUnpaidBalance;

  const CreateInvoiceRequest({
    required this.date,
    required this.customerId,
    required this.invoiceProducts,
    required this.invoiceDraftId,
    this.remainingUnpaidBalance,
  });
}
