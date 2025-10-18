import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';

abstract interface class CustomerService {
  Future<Result<Id, Exception>> create(Customer customer);
  Future<Result<Unit, Exception>> update(Customer customer);

  Stream<Iterable<Customer>> get();

  Stream<Iterable<Customer>> search(String query);

  Future<Result<Customer, Exception>> findWithId(Id id);

  Future<void> delete(Id id);
  Future<Result> deleteAll();
}
