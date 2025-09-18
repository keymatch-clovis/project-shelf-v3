import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/common/date_time_epoch_converter.dart';
import 'package:project_shelf_v3/adapter/dto/database/customer_dto.dart';
import 'package:project_shelf_v3/app/dto/invoice_with_customer_response.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';

part "invoice_dto.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
@DateTimeEpochConverter()
final class InvoiceDto {
  final int id;
  final int number;
  final DateTime date;
  final int remainingUnpaidBalance;
  final int customer;
  final DateTime createdAt;
  final DateTime updatedAt;

  const InvoiceDto({
    required this.id,
    required this.number,
    required this.date,
    required this.remainingUnpaidBalance,
    required this.customer,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InvoiceDto.fromJson(Map<String, dynamic> json) {
    return _$InvoiceDtoFromJson(json);
  }

  Invoice toEntity() {
    return Invoice(number: number, date: date, customerId: customer);
  }
}

final class InvoiceWithCustomerDto {
  final InvoiceDto invoice;
  final CustomerDto customer;

  const InvoiceWithCustomerDto({required this.invoice, required this.customer});

  InvoiceWithCustomerResponse toResponse() {
    return InvoiceWithCustomerResponse(
      invoice: invoice.toEntity(),
      customer: customer.toEntity(),
    );
  }
}
