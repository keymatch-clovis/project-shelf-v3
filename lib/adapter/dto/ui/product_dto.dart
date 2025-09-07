import 'package:money2/money2.dart';
import 'package:project_shelf_v3/app/entity/product.dart';

class ProductDto {
  final int id;
  final String name;
  final Money? defaultPrice;
  final int? stock;

  ProductDto({
    required this.id,
    required this.name,
    this.defaultPrice,
    this.stock,
  });
}

extension ToDto on Product {
  ProductDto toDto() {
    return ProductDto(
      id: id,
      name: name,
      defaultPrice: defaultPrice.amount > Fixed.zero ? defaultPrice : null,
      stock: stock > 0 ? stock : null,
    );
  }
}
