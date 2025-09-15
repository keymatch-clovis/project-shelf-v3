// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerDto _$CustomerDtoFromJson(Map<String, dynamic> json) => CustomerDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  businessName: json['business_name'] as String?,
  city: (json['city'] as num).toInt(),
  address: json['address'] as String?,
  phoneNumber: json['phone_number'] as String?,
  createdAt: const DateTimeEpochConverter().fromJson(
    (json['created_at'] as num).toInt(),
  ),
  updatedAt: const DateTimeEpochConverter().fromJson(
    (json['updated_at'] as num).toInt(),
  ),
  pendingDeleteUntil: _$JsonConverterFromJson<int, DateTime>(
    json['pending_delete_until'],
    const DateTimeEpochConverter().fromJson,
  ),
);

Map<String, dynamic> _$CustomerDtoToJson(CustomerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'business_name': instance.businessName,
      'city': instance.city,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
      'created_at': const DateTimeEpochConverter().toJson(instance.createdAt),
      'updated_at': const DateTimeEpochConverter().toJson(instance.updatedAt),
      'pending_delete_until': _$JsonConverterToJson<int, DateTime>(
        instance.pendingDeleteUntil,
        const DateTimeEpochConverter().toJson,
      ),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
