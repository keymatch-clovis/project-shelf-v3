import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/common/date_time_epoch_converter.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';

part "invoice_product_dto.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
@DateTimeEpochConverter()
final class InvoiceProductDto {
  final int id;
  final int invoice;
  final int product;
  final int quantity;
  final int unitPrice;

  final String currencyIsoCode;

  final DateTime createdAt;

  const InvoiceProductDto({
    required this.id,
    required this.invoice,
    required this.product,
    required this.quantity,
    required this.unitPrice,
    required this.currencyIsoCode,
    required this.createdAt,
  });

  factory InvoiceProductDto.fromJson(Map<String, dynamic> json) {
    return _$InvoiceProductDtoFromJson(json);
  }

  InvoiceProduct toEntity({required Id invoiceId}) {
    return InvoiceProduct(
      id: Some(id),
      invoiceId: Some(invoiceId),
      productId: product,
      unitPrice: Money.fromNum(
        unitPrice,
        isoCode: currencyIsoCode,
        decimalDigits: 0,
      ),
      quantity: quantity,
    );
  }
}
