import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/product/product_search_provider.dart';
import 'package:project_shelf_v3/framework/ui/components/empty_placeholder.dart';
import 'package:project_shelf_v3/framework/ui/components/product_list_tile.dart';

final class ProductSearchList extends ConsumerWidget {
  final Function(ProductDto) onSelect;

  const ProductSearchList({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final stream = ref.watch(productSearchProvider);

    return stream.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
      data: (data) {
        if (data.isEmpty) {
          return EmptyPlaceholder(
            title: localizations.no_products_found,
            icon: Icons.inventory_2_rounded,
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: data.length,
          itemBuilder: (_, index) {
            return ProductListTile(data.toList()[index], onSelect: onSelect);
          },
        );
      },
    );
  }
}
