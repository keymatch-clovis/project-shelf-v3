import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/app/dto/customer_response.dart';
import 'package:project_shelf_v3/app/dto/invoice_response.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class InvoiceDto {
  final Id id;
  final int number;
  final DateTime date;
  final Money remainingUnpaidBalance;
  final CustomerDto customer;

  const InvoiceDto({
    required this.id,
    required this.number,
    required this.date,
    required this.remainingUnpaidBalance,
    required this.customer,
  });

  factory InvoiceDto.fromResponse({
    required InvoiceResponse invoice,
    required CustomerResponse customer,
  }) {
    return InvoiceDto(
      id: invoice.id,
      number: invoice.number,
      date: invoice.date,
      remainingUnpaidBalance: invoice.remainingUnpaidBalance,
      customer: CustomerDto.fromResponse(customer),
    );
  }
}
