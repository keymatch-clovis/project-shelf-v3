import 'package:project_shelf_v3/app/dto/customer_with_city_response.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';

abstract interface class CustomerService {
  /// CREATE related
  Future<Id> create(Customer customer);

  /// UPDATE related
  Future<Customer> update(Customer customer);

  /// READ related
  Stream<List<CustomerWithCityResponse>> watch();
  Stream<List<CustomerWithCityResponse>> search(String query);
  Future<Customer> findById(Id id);

  /// DELETE related
  Future<void> delete(Id id);
}
