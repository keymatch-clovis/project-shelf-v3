final class CreateProductRequest {
  final String name;
  final int? defaultPrice;
  final int? purchasePrice;
  final int? stock;

  CreateProductRequest({
    required this.name,
    this.defaultPrice,
    this.purchasePrice,
    this.stock,
  });
}
