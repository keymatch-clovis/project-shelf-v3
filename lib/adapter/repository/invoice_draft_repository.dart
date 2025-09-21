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
    this.products = const [],
  });
}

final class UpdateArgs {
  final int id;
  final DateTime? date;
  final int? remainingUnpaidBalance;
  final int? customerId;
  final List<CreateProductDto> products;

  const UpdateArgs({
    required this.id,

    this.date,
    this.remainingUnpaidBalance,
    this.customerId,
    this.products = const [],
  });
}

abstract interface class InvoiceDraftRepository {
  /// CREATE related
  Future<int> create(CreateArgs args);

  Future<void> update(UpdateArgs args);

  /// READ related
  Future<List<InvoiceDraftDto>> get();

  Future<InvoiceDraftDto> findWithId(int id);

  Future<void> delete(int id);
}
