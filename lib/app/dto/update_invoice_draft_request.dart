import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';

final class UpdateInvoiceDraftRequest {
  final Id id;
  final Iterable<InvoiceProduct> invoiceProducts;

  final DateTime? date;
  final Id? customerId;

  const UpdateInvoiceDraftRequest({
    required this.id,
    this.invoiceProducts = const [],
    this.date,
    this.customerId,
  });

  @override
  String toString() {
    return "Request[$id]: products=${invoiceProducts.length}, date=$date, customerId=$customerId";
  }
}
