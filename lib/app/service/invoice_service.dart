import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';

abstract interface class InvoiceService {
  Future<Result<Id, Exception>> create(Invoice invoice);
  Future<Result<Unit, Exception>> update(Invoice invoice);

  Stream<Iterable<Invoice>> get();

  Future<Invoice> findWithId(Id id);

  Future<Result<Unit, Exception>> delete(Id id);
  Future<Result> deleteAll();

  Future<Option<int>> getConsecutive();
}
