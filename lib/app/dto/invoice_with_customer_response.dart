import 'package:project_shelf_v3/domain/entity/customer.dart';
import 'package:project_shelf_v3/domain/entity/invoice.dart';

final class InvoiceWithCustomerResponse {
  final Invoice invoice;
  final Customer customer;

  const InvoiceWithCustomerResponse({
    required this.invoice,
    required this.customer,
  });
}
