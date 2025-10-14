import 'package:money2/money2.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class InvoiceProduct {
  final Id? invoiceId;
  final Id productId;
  final Money unitPrice;
  final int quantity;
  final Money total;

  InvoiceProduct({
    required this.productId,
    required this.unitPrice,
    required this.quantity,

    this.invoiceId,
  }) : total = unitPrice * quantity {
    assert(!unitPrice.isNegative);
    assert(quantity > 0);
  }
}
