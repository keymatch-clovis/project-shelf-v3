import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/view_model/product/product_list_view_model.dart';
import 'package:project_shelf_v3/adapter/view_model/product/product_search_view_model.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.products),
        // https://m3.material.io/components/app-bars/specs#fac99130-8bb8-498c-8cb8-16ea056cc3e1
        actionsPadding: EdgeInsets.symmetric(horizontal: 4),
        actions: [_ProductSearchAnchor()],
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.large(
        child: Icon(Icons.add),
        onPressed: () => context.go("/product/create"),
      ),
      body: Center(
        child: Consumer(
          builder: (_, ref, _) {
            final asyncValue = ref.watch(productListProvider);

            return asyncValue.when(
              data: (items) {
                if (items.isEmpty) {
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
                      onTap: () =>
                          context.go('/product/see', extra: items[index].id),
                    );
                  },
                );
              },
              loading: () {
                return Center(child: const CircularProgressIndicator());
              },
              error: (err, _) {
                Logger().f(err);
                throw AssertionError(err);
              },
            );
          },
        ),
      ),
    );
  }
}

class _ProductSearchAnchor extends ConsumerStatefulWidget {
  const _ProductSearchAnchor({super.key});

  @override
  ConsumerState<_ProductSearchAnchor> createState() => _ProductSearchState();
}

class _ProductSearchState extends ConsumerState<_ProductSearchAnchor> {
  final SearchController _searchController = SearchController();

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
          final asyncValue = ref.watch(
            productSearchProvider(_searchController.text),
          );

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
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index].name),
                    onTap: () {
                      _searchController.closeView(null);
                      context.go('/product/see', extra: items[index].id);
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
      suggestionsBuilder: (_, _) => [],
    );
  }
}
