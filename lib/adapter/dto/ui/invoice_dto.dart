import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/city.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';

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

  factory InvoiceDto.fromEntity(
    Invoice entity, {
    required Customer customer,
    required City city,
  }) {
    return InvoiceDto(
      id: entity.id,
      number: entity.number,
      date: entity.date,
      remainingUnpaidBalance: entity.remainingUnpaidBalance,
      customer: CustomerDto.fromEntity(customer, city: city),
    );
  }
}
