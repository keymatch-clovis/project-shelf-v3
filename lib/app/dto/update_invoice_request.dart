import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class UpdateInvoiceProductRequest {
  final Option<Id> id;
  final Id productId;
  final Option<Money> unitPrice;
  final Option<int> quantity;

  const UpdateInvoiceProductRequest({
    required this.id,
    required this.productId,
    required this.unitPrice,
    required this.quantity,
  });
}

final class UpdateInvoiceRequest {
  final Id id;
  final Option<DateTime> date;
  final Iterable<UpdateInvoiceProductRequest> invoiceProducts;

  final Option<Money> remainingUnpaidBalance;

  const UpdateInvoiceRequest({
    required this.id,
    required this.date,
    required this.invoiceProducts,
    required this.remainingUnpaidBalance,
  });
}
