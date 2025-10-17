// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceDto _$InvoiceDtoFromJson(Map<String, dynamic> json) => InvoiceDto(
  id: (json['id'] as num).toInt(),
  number: (json['number'] as num).toInt(),
  date: const DateTimeEpochConverter().fromJson((json['date'] as num).toInt()),
  remainingUnpaidBalance: (json['remaining_unpaid_balance'] as num).toInt(),
  customer: (json['customer'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  currencyIsoCode: json['currency_iso_code'] as String,
  createdAt: const DateTimeEpochConverter().fromJson(
    (json['created_at'] as num).toInt(),
  ),
  updatedAt: const DateTimeEpochConverter().fromJson(
    (json['updated_at'] as num).toInt(),
  ),
);

Map<String, dynamic> _$InvoiceDtoToJson(InvoiceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'date': const DateTimeEpochConverter().toJson(instance.date),
      'remaining_unpaid_balance': instance.remainingUnpaidBalance,
      'customer': instance.customer,
      'total': instance.total,
      'currency_iso_code': instance.currencyIsoCode,
      'created_at': const DateTimeEpochConverter().toJson(instance.createdAt),
      'updated_at': const DateTimeEpochConverter().toJson(instance.updatedAt),
    };
