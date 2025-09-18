import 'package:project_shelf_v3/domain/entity/product.dart';

final class ProductDto {
  final int id;
  final String name;

  const ProductDto({required this.id, required this.name});

  factory ProductDto.fromEntity(Product product) {
    return ProductDto(id: product.id!, name: product.name);
  }
}
