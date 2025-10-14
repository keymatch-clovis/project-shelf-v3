import 'package:project_shelf_v3/app/dto/city_response.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class CityDto {
  final Id id;
  final String name;
  final String department;

  const CityDto({
    required this.id,
    required this.name,
    required this.department,
  });

  factory CityDto.fromResponse(CityResponse city) {
    return CityDto(id: city.id, name: city.name, department: city.department);
  }

  String get fullName => '$name, $department';
}
