final class CreateProductDto {
  final int productId;
  final int unitPrice;
  final int quantity;

  const CreateProductDto({
    required this.productId,
    required this.unitPrice,
    required this.quantity,
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
  final Iterable<CreateProductDto> products;

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
  Future<List<dynamic>> get();

  Future<dynamic> findWithId(int id);

  Future<void> delete(int id);
}
