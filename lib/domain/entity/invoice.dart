import 'package:money2/money2.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class InvoiceProduct {
  final int productId;
  final Money unitPrice;
  final int quantity;

  InvoiceProduct({
    required this.productId,
    required this.unitPrice,
    required this.quantity,
  }) {
    assert(!unitPrice.isNegative);
    assert(quantity > 0);
  }
}

final class Invoice {
  final int? id;
  final int number;
  final DateTime date;
  final Money remainingUnpaidBalance;

  final Id customerId;
  final List<InvoiceProduct> invoiceProducts = [];

  Invoice({
    required this.number,
    required this.date,
    required this.customerId,
    required this.remainingUnpaidBalance,

    this.id,
  }) {
    assert(number > 0);
    assert(customerId > 0);
    assert(!remainingUnpaidBalance.isNegative);
  }

  void addProduct({
    required int productId,
    required Money unitPrice,
    required int quantity,
    required int stock,
  }) {
    assert(quantity > 0);
    assert(!unitPrice.isNegative);

    // Check all the registered products in this invoice to see if they are not
    // exceding the stock value.
    final productQuantity = invoiceProducts
        .where((it) => it.productId == productId)
        .fold(0, (acc, it) {
          return acc + it.quantity;
        });
    assert(stock >= quantity + productQuantity);

    invoiceProducts.add(
      InvoiceProduct(
        productId: productId,
        unitPrice: unitPrice,
        quantity: quantity,
      ),
    );
  }
}
