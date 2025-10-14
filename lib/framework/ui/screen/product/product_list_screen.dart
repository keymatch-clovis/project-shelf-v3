import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/product/product_list_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/product/product_search_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/product/selected_product_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/components/empty_placeholder.dart';
import 'package:project_shelf_v3/framework/ui/components/product_list_tile.dart';
import 'package:project_shelf_v3/framework/ui/components/product_search_list.dart';
import 'package:project_shelf_v3/framework/ui/components/shelf_search_bar.dart';
import 'package:project_shelf_v3/framework/ui/components/sliver_header_delegate.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

final class ProductListScreen extends ConsumerStatefulWidget {
  const ProductListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _ProductListScreenState();
  }
}

final class _ProductListScreenState extends ConsumerState<ProductListScreen> {
  late SearchController searchController;

  @override
  void initState() {
    super.initState();

    searchController = SearchController();
  }

  @override
  Widget build(BuildContext context) {
    // This search provider by itself is useless, as it is marked as
    // autodispose. This means this widget is dependent on a parent widget
    // listening to the search provider.
    // This is created this way to make the search provider constrained to the
    // views using it.
    //
    // NOTE: I don't know another way of doing this.
    ref.listen(productSearchProvider, (_, _) {});

    return _Screen(
      searchController: searchController,
      onCreate: () => context.go(CustomRoute.PRODUCT_CREATE.route),
      onSearch: ref.read(productSearchProvider.notifier).updateQuery,
      onSelect: (product) {
        if (searchController.isOpen) {
          searchController.clear();
          searchController.closeView(null);

          // I think we need to do this because the search controller is
          // closing a route, so we need to do this after the route has closed.
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => FocusScope.of(context).unfocus(),
          );
        }

        ref.read(selectedProductProvider.notifier).select(product);
        context.go(CustomRoute.PRODUCT_DETAILS.route);
      },
    );
  }
}

final class _Screen extends StatelessWidget {
  final SearchController searchController;

  final void Function() onCreate;
  final void Function(String) onSearch;
  final void Function(ProductDto) onSelect;

  const _Screen({
    required this.searchController,

    required this.onCreate,
    required this.onSearch,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: COMPACT_SPACING_H,
          child: CustomScrollView(
            slivers: [
              _AppBar(
                searchController: searchController,
                onSearch: onSearch,
                onSelect: onSelect,
              ),
              _BodyPane(onSelect: onSelect),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: onCreate,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}

final class _AppBar extends StatelessWidget {
  final SearchController searchController;

  final void Function(String) onSearch;
  final void Function(ProductDto) onSelect;

  const _AppBar({
    required this.searchController,

    required this.onSearch,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SliverPersistentHeader(
      floating: true,
      delegate: SliverHeaderDelegate(
        height: SEARCH_APP_BAR_HEIGHT,
        child: ShelfSearchBar(
          consumerWidget: ProductSearchList(onSelect: onSelect),
          hintText: localizations.search_product,
          searchController: searchController,
          onSearch: onSearch,
        ),
      ),
    );
  }
}

final class _BodyPane extends ConsumerWidget {
  final void Function(ProductDto) onSelect;

  const _BodyPane({required this.onSelect});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productListProvider);

    return state.when(
      data: (items) {
        return _ProductList(items.toList(), onSelect: onSelect);
      },
      loading: () => SliverFillRemaining(
        hasScrollBody: false,
        fillOverscroll: true,
        child: const Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
    );
  }
}

class _ProductList extends ConsumerWidget {
  final List<ProductDto> items;

  final void Function(ProductDto) onSelect;

  const _ProductList(this.items, {required this.onSelect});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    if (items.isEmpty) {
      return EmptyPlaceholder(
        title: localizations.no_products,
        icon: Icons.inventory_2_rounded,
      );
    }

    return SliverList.separated(
      separatorBuilder: (_, _) => const SizedBox(height: XS_SPACING),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ProductListTile(items[index], onSelect: onSelect);
      },
    );
  }
}
