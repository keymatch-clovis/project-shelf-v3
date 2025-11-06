import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/common/date_time_epoch_converter.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';
import 'package:project_shelf_v3/domain/entity/invoice_product.dart';

part "invoice_dto.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
@DateTimeEpochConverter()
final class InvoiceDto {
  final int id;
  final int number;
  final DateTime date;
  final int remainingUnpaidBalance;
  final int customer;
  final int total;

  final String currencyIsoCode;

  final DateTime createdAt;
  final DateTime updatedAt;

  const InvoiceDto({
    required this.id,
    required this.number,
    required this.date,
    required this.remainingUnpaidBalance,
    required this.customer,
    required this.total,
    required this.currencyIsoCode,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InvoiceDto.fromJson(Map<String, dynamic> json) {
    return _$InvoiceDtoFromJson(json);
  }

  Invoice toEntity() {
    final currency = Currency.create(currencyIsoCode, 0);

    return Invoice(
      id: id,
      number: number,
      date: date,
      currency: currency,
      remainingUnpaidBalance: Money.fromIntWithCurrency(
        remainingUnpaidBalance,
        currency,
      ),
      customerId: customer,
    );
  }
}
