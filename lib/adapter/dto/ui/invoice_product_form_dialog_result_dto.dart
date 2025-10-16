import 'package:project_shelf_v3/adapter/dto/ui/invoice_product_dto.dart';

enum InvoiceProductFormDialogAction { DISMISS, DELETE, EDIT, CREATE }

final class InvoiceProductFormDialogResultDto {
  final InvoiceProductFormDialogAction action;

  final InvoiceProductDto? invoiceProduct;

  const InvoiceProductFormDialogResultDto({
    required this.action,

    this.invoiceProduct,
  });
}
