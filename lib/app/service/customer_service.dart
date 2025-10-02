import 'package:project_shelf_v3/app/dto/customer_response.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';

abstract interface class CustomerService {
  /// CREATE related
  Future<Id> create(Customer customer);

  /// UPDATE related
  Future<void> update(Customer customer);

  /// READ related
  Stream<Iterable<CustomerResponse>> watch();
  Stream<Iterable<CustomerResponse>> search(String query);
  Future<CustomerResponse> findWithId(Id id);

  /// DELETE related
  Future<void> delete(Id id);
}
