import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/product/product_list_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/product/selected_product_provider.dart';
import 'package:project_shelf_v3/framework/ui/components/product_list_tile.dart';
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
      floatingActionButton: FloatingActionButton.large(
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

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: products.length,
      separatorBuilder: (_, index) {
        return const Divider(height: 1);
      },
      itemBuilder: (context, index) {
        return ProductListTile(
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
