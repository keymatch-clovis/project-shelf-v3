import 'package:money2/money2.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/aggregate/invoice_aggregate.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';

final class Invoice {
  final Id id;
  final int number;
  final DateTime date;
  final Id customerId;

  final Money remainingUnpaidBalance;
  final Currency currency;

  Invoice({
    required this.id,
    required this.number,
    required this.date,
    required this.remainingUnpaidBalance,
    required this.currency,
    required this.customerId,
  }) {
    assert(id > 0);
    assert(number > 0);
    assert(customerId > 0);
    assert(!remainingUnpaidBalance.isNegative);
  }

  Money getTotal(Iterable<InvoiceProduct> products) {
    return products.fold(currency.zero, (acc, it) {
      return acc + (it.unitPrice * it.quantity);
    });
  }
}

extension Total on InvoiceAggregate {
  Money getTotal() {
    return products.fold(currency.zero, (acc, it) {
      return acc + (it.unitPrice * it.quantity);
    });
  }
}
