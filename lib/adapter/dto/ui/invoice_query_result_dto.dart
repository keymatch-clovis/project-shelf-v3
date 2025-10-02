import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class InvoiceQueryResultDto {
  final Id id;
  final int number;
  final DateTime date;
  final CustomerDto customer;

  const InvoiceQueryResultDto({
    required this.id,
    required this.number,
    required this.date,
    required this.customer,
  });
}
