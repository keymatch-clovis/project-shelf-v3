import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/dto/customer_response.dart';
import 'package:project_shelf_v3/app/dto/invoice_response.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';

abstract interface class InvoiceService {
  /// CREATE related
  Future<Id> create(Invoice invoice);

  /// READ related
  Stream<Iterable<InvoiceResponse>> watch(Currency currency);
  Stream<Iterable<(InvoiceResponse, CustomerResponse)>> watchPopulated(
    Currency currency,
  );

  Future<Iterable<InvoiceProduct>> findInvoiceProducts(Id invoiceId);
  Future<InvoiceResponse> findWithId(Id id, {required Currency currency});

  Future<Iterable<InvoiceResponse>> searchWith({
    required Currency currency,
    Id? customerId,
  });

  // DELETE related
  Future<Result> deleteAll();

  /// Other
  Future<int?> getConsecutive();
}
