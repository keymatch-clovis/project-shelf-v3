import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/riverpod/product_search_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/selected_product_provider.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

final class ProductSearchAnchor extends ConsumerStatefulWidget {
  const ProductSearchAnchor({super.key});

  @override
  ConsumerState<ProductSearchAnchor> createState() => _ProductSearchState();
}

class _ProductSearchState extends ConsumerState<ProductSearchAnchor> {
  final SearchController _searchController = SearchController();

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      ref
          .read(productSearchProvider.notifier)
          .updateQuery(_searchController.text);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      viewPadding: EdgeInsets.zero,
      isFullScreen: true,
      textCapitalization: TextCapitalization.characters,
      searchController: _searchController,
      builder: (context, controller) {
        return IconButton(
          icon: const Icon(Icons.search),
          onPressed: controller.openView,
        );
      },
      viewBuilder: (_) => Consumer(
        builder: (_, ref, _) {
          final asyncValue = ref.watch(productSearchProvider);

          return asyncValue.when(
            data: (items) {
              if (items.isEmpty) {
                // TODO: FIX THIS MF
                return Center(child: Text("no data"));
              }

              return ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: items.length,
                separatorBuilder: (_, index) {
                  return const Divider(height: 1);
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index].name),
                    onTap: () {
                      ref
                          .read(selectedProductProvider.notifier)
                          .select(items[index]);

                      context.go(CustomRoute.productDetails.route);

                      _searchController.clear();
                      _searchController.closeView(null);
                    },
                  );
                },
              );
            },
            loading: () {
              return Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: Center(child: const CircularProgressIndicator()),
              );
            },
            error: (err, _) => Text(err.toString()),
          );
        },
      ),
      suggestionsBuilder: (_, _) => const [],
    );
  }
}
