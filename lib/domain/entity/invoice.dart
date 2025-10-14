import 'package:money2/money2.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';

final class Invoice {
  final int? id;
  final int number;
  final DateTime date;
  final Money remainingUnpaidBalance;

  final Id customerId;
  final List<InvoiceProduct> invoiceProducts = [];

  Invoice(
    Currency currency, {
    required this.number,
    required this.date,
    required this.customerId,
    required this.remainingUnpaidBalance,

    this.id,
  }) : total = currency.zero {
    assert(number > 0);
    assert(customerId > 0);
    assert(!remainingUnpaidBalance.isNegative);
  }

  Money total;

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

    total += unitPrice * quantity;
  }
}
