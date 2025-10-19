import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';

final class Invoice {
  final Option<Id> id;
  final int number;
  final DateTime date;
  final Id customerId;

  final Money remainingUnpaidBalance;
  final Currency currency;

  final Iterable<InvoiceProduct> invoiceProducts;

  Invoice({
    required this.id,
    required Option<int> number,
    required this.date,
    required this.remainingUnpaidBalance,
    required this.currency,
    required this.customerId,
    // Rich domain.
    // https://paulovich.net/rich-domain-model-with-ddd-tdd-reviewed/
    required this.invoiceProducts,
  }) : // If no number was assigned, we will assume this is the first invoice.
       number = number.unwrapOr(1) {
    assert(this.number > 0);
    assert(customerId > 0);
    assert(!remainingUnpaidBalance.isNegative);

    for (var it in invoiceProducts) {
      assert(it.quantity > 0);
      assert(!it.unitPrice.isNegative);
    }
  }

  Money get total {
    return invoiceProducts.fold(currency.zero, (acc, it) {
      return acc + (it.unitPrice * it.quantity);
    });
  }

  Invoice copyWith({
    Id? id,
    DateTime? date,
    Money? remainingUnpaidBalance,
    Currency? currency,
    Iterable<InvoiceProduct>? invoiceProducts,
  }) {
    return Invoice(
      // Because of this little change right here, we can't use [freezed]. It's
      // unfortunate, but [oxidized] has the priority here.
      number: Some(number),
      customerId: customerId,
      id: id != null ? Option.from(id) : this.id,
      date: date ?? this.date,
      remainingUnpaidBalance:
          remainingUnpaidBalance ?? this.remainingUnpaidBalance,
      currency: currency ?? this.currency,
      invoiceProducts: invoiceProducts ?? this.invoiceProducts,
    );
  }
}
