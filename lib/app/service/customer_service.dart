import 'package:project_shelf_v3/app/entity/city.dart';
import 'package:project_shelf_v3/app/entity/customer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class CreateArgs {
  final String name;
  final String? businessName;
  final City city;
  final String? address;
  final String? phoneNumber;

  const CreateArgs({
    required this.name,
    this.businessName,
    required this.city,
    this.address,
    this.phoneNumber,
  });
}

final class UpdateArgs {
  final Id id;
  final String name;
  final String? businessName;
  final City city;
  final String? address;
  final String? phoneNumber;

  const UpdateArgs({
    required this.id,
    required this.name,
    this.businessName,
    required this.city,
    this.address,
    this.phoneNumber,
  });
}

abstract interface class CustomerService {
  /// CREATE related
  Future<Id> create(CreateArgs args);

  /// UPDATE related
  Future<Customer> update(UpdateArgs args);

  /// READ related
  Stream<List<Customer>> watch();
  Stream<List<Customer>> search(String query);
  Future<Customer> findById(Id id);

  /// DELETE related
  Future<void> delete(Id id);
}
