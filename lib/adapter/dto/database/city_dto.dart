import 'package:json_annotation/json_annotation.dart';
import 'package:project_shelf_v3/app/entity/city.dart';

part 'city_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CityDto {
  final int id;
  final String name;
  final String department;

  CityDto({required this.id, required this.name, required this.department});

  factory CityDto.fromJson(Map<String, dynamic> json) =>
      _$CityDtoFromJson(json);

  City toEntity() {
    return City(id: id, name: name, department: department);
  }
}
