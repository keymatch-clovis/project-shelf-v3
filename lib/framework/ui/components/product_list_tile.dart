import 'package:flutter/material.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';

class ProductListTile extends StatelessWidget {
  final ProductDto product;
  final void Function(ProductDto)? onTap;

  const ProductListTile({required this.product, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(height: 1);
    final baseStyle = TextStyle(height: 1);

    return ListTile(
      title: Text(product.name, style: nameStyle),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.defaultPrice.toString(), style: baseStyle),
          Text(product.stock.toString(), style: baseStyle),
        ],
      ),
      onTap: onTap != null ? () => onTap!(product) : null,
    );
  }
}
