// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceProductDto _$InvoiceProductDtoFromJson(Map<String, dynamic> json) =>
    InvoiceProductDto(
      id: (json['id'] as num).toInt(),
      invoice: (json['invoice'] as num).toInt(),
      product: (json['product'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unit_price'] as num).toInt(),
      createdAt: const DateTimeEpochConverter().fromJson(
        (json['created_at'] as num).toInt(),
      ),
    );

Map<String, dynamic> _$InvoiceProductDtoToJson(InvoiceProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'invoice': instance.invoice,
      'product': instance.product,
      'quantity': instance.quantity,
      'unit_price': instance.unitPrice,
      'created_at': const DateTimeEpochConverter().toJson(instance.createdAt),
    };
