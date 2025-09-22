import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/product/product_search_provider.dart';

final class ProductSearchAnchor extends ConsumerStatefulWidget {
  final void Function(ProductDto) onSelect;

  const ProductSearchAnchor({super.key, required this.onSelect});

  @override
  ConsumerState<ProductSearchAnchor> createState() => _State();
}

final class _State extends ConsumerState<ProductSearchAnchor> {
  final searchController = SearchController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      viewPadding: EdgeInsets.zero,
      isFullScreen: true,
      textCapitalization: TextCapitalization.characters,
      keyboardType: TextInputType.text,
      searchController: searchController,
      textInputAction: TextInputAction.next,
      viewOnSubmitted: (_) {},
      builder: (_, controller) {
        return FloatingActionButton(
          elevation: 0,
          child: const Icon(Icons.add_rounded),
          onPressed: () {
            controller.openView();
          },
        );
      },
      viewBuilder: (_) => _ListView(
        onSelect: (item) {
          searchController.closeView(null);
          widget.onSelect(item);
        },
      ),
      suggestionsBuilder: (_, controller) {
        ref.read(productSearchProvider.notifier).updateQuery(controller.text);
        return const [];
      },
    );
  }
}

final class _ListView extends ConsumerWidget {
  final void Function(ProductDto) onSelect;

  const _ListView({required this.onSelect});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final items = ref.watch(productSearchProvider);

    return items.when(
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (it) {
        if (it.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.category_rounded,
                  size: 96,
                  color: theme.colorScheme.outline,
                ),
                Text(
                  localizations.no_products_found,
                  style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: it.length,
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemBuilder: (_, index) => _ListTile(it[index], onSelect: onSelect),
        );
      },
    );
  }
}

final class _ListTile extends StatelessWidget {
  final ProductDto item;
  final void Function(ProductDto) onSelect;

  const _ListTile(this.item, {required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListTile(onTap: () => onSelect(item), title: Text(item.name));
  }
}
