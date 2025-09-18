import 'package:project_shelf_v3/app/dto/invoice_with_customer_response.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';

abstract interface class InvoiceService {
  /// CREATE related
  void create(Invoice invoice);

  /// READ related
  Stream<List<InvoiceWithCustomerResponse>> watch();

  /// Other
  Future<int> getConsecutive();
}
