import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class InvoiceProduct {
  final Option<Id> id;
  final Option<Id> invoiceId;
  final Id productId;
  final Money unitPrice;
  final int quantity;
  final Money total;

  InvoiceProduct({
    required this.id,
    required this.invoiceId,
    required this.productId,
    required this.unitPrice,
    required this.quantity,
  }) : total = unitPrice * quantity {
    assert(!unitPrice.isNegative);
    assert(quantity > 0);
  }

  InvoiceProduct copyWith({Id? productId, Money? unitPrice, int? quantity}) {
    return InvoiceProduct(
      id: id,
      invoiceId: invoiceId,
      productId: productId ?? this.productId,
      unitPrice: unitPrice ?? this.unitPrice,
      quantity: quantity ?? this.quantity,
    );
  }
}
