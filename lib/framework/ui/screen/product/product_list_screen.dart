import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/product/product_list_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/product/selected_product_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.products),
        //actions: [ProductSearchAnchor()],
      ),
      body: SafeArea(
        child: Padding(
          padding: COMPACT_SPACING_H,
          child: Builder(
            builder: (context) {
              return Consumer(
                builder: (_, ref, _) {
                  return ref
                      .watch(productListProvider)
                      .when(
                        data: (items) => _ProductList(items),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (err, _) {
                          Logger().f(err);
                          throw AssertionError(err);
                        },
                      );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => context.go("/product/create"),
      ),
    );
  }
}

class _ProductList extends ConsumerWidget {
  final List<ProductDto> products;

  const _ProductList(this.products);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    if (products.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_2_outlined, size: 96),
            Text(localizations.no_products),
          ],
        ),
      );
    }

    // Trying to follow:
    // https://m3.material.io/blog/building-with-m3-expressive
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: products.length,
      separatorBuilder: (_, _) => const SizedBox(height: XS_SPACING),
      itemBuilder: (context, index) {
        return _ListTile(
          product: products[index],
          onTap: (product) {
            ref.read(selectedProductProvider.notifier).select(products[index]);

            context.go(CustomRoute.PRODUCT_DETAILS.route);
          },
        );
      },
    );
  }
}

final class _ListTile extends StatelessWidget {
  final ProductDto product;
  final void Function(ProductDto)? onTap;

  const _ListTile({required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(height: 1);
    final baseStyle = TextStyle(height: 1);

    // Trying to follow:
    // https://m3.material.io/blog/building-with-m3-expressive
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: ListTile(
        title: Text(product.name, style: nameStyle),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.defaultPrice.toString(), style: baseStyle),
            Text(product.stock.toString(), style: baseStyle),
          ],
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: onTap != null ? () => onTap!(product) : null,
      ),
    );
  }
}
