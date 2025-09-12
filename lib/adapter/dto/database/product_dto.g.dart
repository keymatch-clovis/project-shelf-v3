// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  defaultPrice: (json['default_price'] as num).toInt(),
  purchasePrice: (json['purchase_price'] as num).toInt(),
  stock: (json['stock'] as num).toInt(),
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

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'default_price': instance.defaultPrice,
      'purchase_price': instance.purchasePrice,
      'stock': instance.stock,
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
