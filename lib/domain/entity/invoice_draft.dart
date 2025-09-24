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
  final DateTime createdAt;
  final List<InvoiceDraftProduct> products;

  InvoiceDraft({
    this.date,
    this.id,
    this.customerId,
    this.remainingUnpaidBalance,
    List<InvoiceDraftProduct>? products,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       products = products ?? [];

  Id? id;

  // We can use this structure for checking fields:
  //
  // DateTime? _date;
  // DateTime? get date => _date;
  // set date(DateTime? date) {
  //   _date = date;
  // }

  DateTime? date;

  Id? customerId;
  int? remainingUnpaidBalance;

  void clearProducts() {
    products.clear();
  }

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
