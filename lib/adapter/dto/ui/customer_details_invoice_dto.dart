import 'package:money2/money2.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class CustomerDetailsInvoiceDto {
  final Id id;
  final int number;
  final DateTime date;
  final Money remainingUnpaidBalance;

  const CustomerDetailsInvoiceDto({
    required this.id,
    required this.number,
    required this.date,
    required this.remainingUnpaidBalance,
  });
}
