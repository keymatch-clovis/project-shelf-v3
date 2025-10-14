import 'package:flutter/material.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/framework/ui/components/shelf_card.dart';

class ProductListTile extends StatelessWidget {
  final ProductDto product;
  final void Function(ProductDto) onSelect;

  const ProductListTile(this.product, {super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ShelfCard(
      padding: EdgeInsets.zero,
      child: ListTile(
        visualDensity: VisualDensity.compact,
        title: Text(product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.defaultPrice.toString()),
            Text(product.stock.toString()),
          ],
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () => onSelect(product),
      ),
    );
  }
}
