import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/product/product_search_provider.dart';
import 'package:project_shelf_v3/framework/ui/components/empty_placeholder.dart';

final class ProductSearchAnchor extends ConsumerStatefulWidget {
  final void Function(ProductDto) onSelect;

  const ProductSearchAnchor({super.key, required this.onSelect});

  @override
  ConsumerState<ProductSearchAnchor> createState() => _State();
}

final class _State extends ConsumerState<ProductSearchAnchor> {
  final searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          backgroundColor: theme.colorScheme.secondaryContainer,
          foregroundColor: theme.colorScheme.onSecondaryContainer,
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
    final items = ref.watch(productSearchProvider);

    return items.when(
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (it) {
        if (it.isEmpty) {
          return EmptyPlaceholder(
            icon: Icons.category_outlined,
            title: localizations.no_products,
          );
        }

        return ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: it.length,
          separatorBuilder: (_, _) => const Divider(height: 1),
          itemBuilder: (_, index) =>
              _ListTile(it.toList()[index], onSelect: onSelect),
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
    return ListTile(
      visualDensity: VisualDensity.compact,
      title: Text(item.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(item.defaultPrice.toString()), Text('× ${item.stock}')],
      ),
      onTap: () => onSelect(item),
    );
  }
}
