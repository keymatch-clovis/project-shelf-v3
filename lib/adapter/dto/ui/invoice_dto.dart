import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/app/dto/invoice_with_customer_response.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';

final class InvoiceDto {
  final int number;

  const InvoiceDto({required this.number});

  factory InvoiceDto.fromEntity(Invoice invoice) {
    return InvoiceDto(number: invoice.number);
  }
}

final class InvoiceWithCustomerDto {
  final InvoiceDto invoice;
  final CustomerDto customer;

  const InvoiceWithCustomerDto({required this.invoice, required this.customer});

  factory InvoiceWithCustomerDto.fromResponse(
    InvoiceWithCustomerResponse response,
  ) {
    return InvoiceWithCustomerDto(
      invoice: InvoiceDto.fromEntity(response.invoice),
      customer: CustomerDto.fromEntity(response.customer),
    );
  }
}
