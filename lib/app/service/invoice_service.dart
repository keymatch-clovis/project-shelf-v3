import 'package:project_shelf_v3/app/dto/customer_response.dart';
import 'package:project_shelf_v3/app/dto/invoice_product_response.dart';
import 'package:project_shelf_v3/app/dto/invoice_response.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';

abstract interface class InvoiceService {
  /// CREATE related
  Future<Id> create(Invoice invoice);

  /// READ related
  Stream<Iterable<InvoiceResponse>> watch();
  Stream<Iterable<(InvoiceResponse, CustomerResponse)>> watchPopulated();

  Future<Iterable<InvoiceProductResponse>> findInvoiceProducts(Id id);
  Future<InvoiceResponse> findWithId(Id id);

  /// Other
  Future<int?> getConsecutive();
}
