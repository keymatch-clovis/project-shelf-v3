import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/database/customer_dto.dart';
import 'package:project_shelf_v3/adapter/dto/database/city_dto.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class CreateArgs {
  final String name;
  final String? businessName;
  final Id cityId;
  final String? address;
  final String? phoneNumber;

  const CreateArgs({
    required this.name,
    this.businessName,
    required this.cityId,
    this.address,
    this.phoneNumber,
  });
}

final class UpdateArgs {
  final Id id;
  final String name;
  final String? businessName;
  final Id cityId;
  final String? address;
  final String? phoneNumber;

  const UpdateArgs({
    required this.id,
    required this.name,
    this.businessName,
    required this.cityId,
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
  Stream<Iterable<(CustomerDto, CityDto)>> watchPopulated();

  Stream<Iterable<(CustomerDto, CityDto)>> searchPopulated(String value);

  Future<CustomerDto> findWithId(Id id);
  Future<(CustomerDto, CityDto)> findWithIdPopulated(Id id);

  /// DELETE related
  Future<void> delete(Id id);
  Future<Result> deleteAll();
}
