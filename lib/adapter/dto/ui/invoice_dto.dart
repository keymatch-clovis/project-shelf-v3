import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_product_dto.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class InvoiceDto {
  final Id id;
  final int number;
  final DateTime date;
  final Money remainingUnpaidBalance;
  final CustomerDto customer;

  final List<InvoiceProductDto> invoiceProducts;

  const InvoiceDto({
    required this.id,
    required this.number,
    required this.date,
    required this.remainingUnpaidBalance,
    required this.customer,
    required this.invoiceProducts,
  });
}
