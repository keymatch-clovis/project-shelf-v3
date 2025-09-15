import 'package:project_shelf_v3/adapter/dto/database/customer_dto.dart';
import 'package:project_shelf_v3/app/entity/city.dart';
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

abstract interface class CustomerRepository {
  /// CREATE related
  Future<Id> create(CreateArgs args);

  /// UPDATE related
  Future<CustomerDto> update(UpdateArgs args);

  /// READ related
  Stream<List<CustomerDto>> watch();
  Stream<List<CustomerWithCityDto>> watchPopulated();

  Stream<List<CustomerDto>> search(String value);
  Stream<List<CustomerWithCityDto>> searchPopulated(String value);

  Future<CustomerDto> findById(Id id);
  Future<CustomerWithCityDto> findByIdPopulated(Id id);

  /// DELETE related
  Future<void> delete(Id id);
}
