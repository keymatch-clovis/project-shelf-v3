// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityDto _$CityDtoFromJson(Map<String, dynamic> json) => CityDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  department: json['department'] as String,
);

Map<String, dynamic> _$CityDtoToJson(CityDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'department': instance.department,
};
