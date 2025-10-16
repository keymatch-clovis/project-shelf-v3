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

  DateTime? date;

  Id? customerId;
  Money? remainingUnpaidBalance;

  void clearProducts() {
    products.clear();
  }

  void addProduct({
    required int productId,
    required Money unitPrice,
    required int quantity,
  }) {
    assert(quantity > 0);
    assert(!unitPrice.isNegative);

    products.add(
      InvoiceDraftProduct(
        productId: productId,
        unitPrice: unitPrice,
        quantity: quantity,
      ),
    );
  }
}
