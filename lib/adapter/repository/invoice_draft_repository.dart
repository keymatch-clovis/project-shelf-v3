import 'package:project_shelf_v3/adapter/dto/object_box/invoice_draft_dto.dart';

final class CreateProductDto {
  final int productId;
  final int quantity;
  final int unitPrice;

  const CreateProductDto({
    required this.productId,
    required this.quantity,
    required this.unitPrice,
  });
}

final class CreateArgs {
  final DateTime? date;
  final int? remainingUnpaidBalance;
  final int? customerId;
  final List<CreateProductDto> products;

  const CreateArgs({
    this.date,
    this.remainingUnpaidBalance,
    this.customerId,
    required this.products,
  });
}

abstract interface class InvoiceDraftRepository {
  /// CREATE related
  int createInvoiceDraft(CreateArgs args);

  /// READ related
  List<InvoiceDraftDto> getInvoiceDrafts();
}
