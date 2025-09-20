import 'package:money2/money2.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class InvoiceDraftProduct {
  final Id productId;
  final int quantity;
  final Money unitPrice;

  InvoiceDraftProduct({
    required this.productId,
    required this.quantity,
    required this.unitPrice,
  }) {
    assert(!unitPrice.isNegative);
    assert(quantity > 0);
  }
}

final class InvoiceDraft {
  final DateTime date;

  Id? id;
  final Id? customerId;
  final int? remainingUnpaidBalance;

  final List<InvoiceDraftProduct> products;

  InvoiceDraft({
    DateTime? date,
    this.id,
    this.customerId,
    this.remainingUnpaidBalance,

    this.products = const [],
  }) : date = date ?? DateTime.now();

  void addProduct({
    required int productId,
    required Money unitPrice,
    required int quantity,
    required int currentStock,
  }) {
    assert(quantity > 0);
    assert(!unitPrice.isNegative);

    // Check all the registered products in this invoice to see if they are not
    // exceding the stock value.
    final productQuantity = products
        .where((it) => it.productId == productId)
        .fold(0, (acc, it) {
          return acc + it.quantity;
        });
    assert(currentStock >= quantity + productQuantity);

    products.add(
      InvoiceDraftProduct(
        productId: productId,
        unitPrice: unitPrice,
        quantity: quantity,
      ),
    );
  }
}
