import 'package:money2/money2.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class InvoiceProductResponse {
  final Id invoiceId;
  final Id productId;
  final Money unitPrice;
  final int quantity;

  const InvoiceProductResponse({
    required this.invoiceId,
    required this.productId,
    required this.unitPrice,
    required this.quantity,
  });
}
