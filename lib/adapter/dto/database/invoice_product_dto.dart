import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/common/date_time_epoch_converter.dart';

part "invoice_product_dto.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
@DateTimeEpochConverter()
final class InvoiceProductDto {
  final int id;
  final int invoice;
  final int product;
  final int quantity;
  final int unitPrice;
  final DateTime createdAt;

  const InvoiceProductDto({
    required this.id,
    required this.invoice,
    required this.product,
    required this.quantity,
    required this.unitPrice,
    required this.createdAt,
  });

  factory InvoiceProductDto.fromJson(Map<String, dynamic> json) {
    return _$InvoiceProductDtoFromJson(json);
  }
}
