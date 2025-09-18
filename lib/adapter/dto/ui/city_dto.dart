import 'package:project_shelf_v3/domain/entity/city.dart';

final class CityDto {
  final int id;
  final String name;
  final String department;

  const CityDto({
    required this.id,
    required this.name,
    required this.department,
  });

  factory CityDto.fromEntity(City city) {
    return CityDto(id: city.id!, name: city.name, department: city.department);
  }
}
