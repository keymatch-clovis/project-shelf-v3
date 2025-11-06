import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';

final class UpdateInvoiceDraftRequest {
  final Id id;
  final Iterable<InvoiceProduct> invoiceProducts;
  final Option<DateTime> date;
  final Option<Id> customerId;
  final Option<Money> remainingUnpaidBalance;

  const UpdateInvoiceDraftRequest({
    required this.id,
    required this.invoiceProducts,
    required this.date,
    required this.customerId,
    required this.remainingUnpaidBalance,
  });

  @override
  String toString() {
    return "Request[$id]: products=${invoiceProducts.length}, date=$date, customerId=$customerId";
  }
}
