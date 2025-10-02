import 'package:project_shelf_v3/common/typedefs.dart';

final class InvoiceResponse {
  final Id id;
  final int number;
  final DateTime date;
  final int remainingUnpaidBalance;
  final Id customerId;

  const InvoiceResponse({
    required this.id,
    required this.number,
    required this.date,
    required this.remainingUnpaidBalance,
    required this.customerId,
  });
}
