import 'package:project_shelf_v3/common/typedefs.dart';

final class CreateInvoiceProductDto {
  final int productId;
  final int unitPrice;
  final int quantity;

  const CreateInvoiceProductDto({
    required this.productId,
    required this.unitPrice,
    required this.quantity,
  });
}

final class CreateInvoiceDto {
  final DateTime date;
  final Id customerId;
  final List<CreateInvoiceProductDto> invoiceProducts;
  final int? remainingUnpaidBalance;

  const CreateInvoiceDto({
    required this.date,
    required this.customerId,
    required this.invoiceProducts,
    this.remainingUnpaidBalance,
  });
}
