import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';

final class InvoiceAggregate {
  final int number;
  final DateTime date;
  final Id customerId;

  final Money remainingUnpaidBalance;
  final Currency currency;

  // Rich domain.
  // https://paulovich.net/rich-domain-model-with-ddd-tdd-reviewed/
  final Iterable<InvoiceProduct> products;

  InvoiceAggregate({
    required this.customerId,
    required this.currency,
    required this.products,
    required Option<int> number,
    required Option<Money> remainingUnpaidBalance,
    required Option<DateTime> date,
  }) : // If no number was assigned, we will assume this is the first invoice.
       number = number.unwrapOr(1),
       remainingUnpaidBalance = remainingUnpaidBalance.unwrapOr(currency.zero),
       date = date.unwrapOr(DateTime.now()) {
    assert(this.number > 0);
    assert(!this.remainingUnpaidBalance.isNegative);
  }
}
