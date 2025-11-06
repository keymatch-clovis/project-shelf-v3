import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/city.dart';

final class CityDto {
  final Id id;
  final String name;
  final String department;

  const CityDto({
    required this.id,
    required this.name,
    required this.department,
  });

  factory CityDto.fromEntity(City city) {
    return CityDto(
      id: city.id.unwrap(),
      name: city.name,
      department: city.department,
    );
  }

  String get fullName => '$name, $department';
}
