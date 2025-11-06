import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/aggregate/invoice_aggregate.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';

abstract interface class InvoiceService {
  Future<Result<Id, Exception>> create(InvoiceAggregate aggregate);
  Future<Result<Unit, Exception>> update(
    Invoice invoice, {
    required Iterable<InvoiceProduct> products,
  });

  Stream<Iterable<Invoice>> get();

  Future<Result<Iterable<InvoiceProduct>, Exception>> findInvoiceProducts(
    Id id, {
    required Currency currency,
  });

  Future<Invoice> findWithId(Id id);
  Future<Result<Iterable<Invoice>, Exception>> findWithCustomerId(Id id);

  Future<Result<Unit, Exception>> delete(Id id);
  Future<Result> deleteAll();

  Future<Option<int>> getConsecutive();
}
