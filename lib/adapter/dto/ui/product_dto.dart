import 'package:money2/money2.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';

final class ProductDto {
  final int id;
  final String name;
  final Money defaultPrice;
  final Money purchasePrice;
  final int stock;

  const ProductDto({
    required this.id,
    required this.name,
    required this.defaultPrice,
    required this.purchasePrice,
    required this.stock,
  });

  factory ProductDto.fromEntity(Product product) {
    return ProductDto(
      id: product.id.unwrap(),
      name: product.name,
      defaultPrice: product.defaultPrice,
      purchasePrice: product.purchasePrice,
      stock: product.stock,
    );
  }
}
