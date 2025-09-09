import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/bloc/product_list_bloc.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductListBloc()..add(ProductsFetched()),
      child: const _ProductListView(),
    );
  }
}

class _ProductListView extends StatelessWidget {
  const _ProductListView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              // This widget takes the overlapping behavior of the SliverAppBar,
              // and redirects it to the SliverOverlapInjector below. If it is
              // missing, then it is possible for the nested "inner" scroll view
              // below to end up under the SliverAppBar even when the inner
              // scroll view thinks it has not been scrolled.
              // This is not necessary if the "headerSliverBuilder" only builds
              // widgets that do not overlap the next sliver.
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: _SliverAppBar(
                innerBoxIsScrolled: innerBoxIsScrolled,
                onDelete: () => {},
              ),
            ),
          ];
        },
        body: SafeArea(
          child: Builder(
            builder: (context) {
              return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                  ),
                  _ProductList(),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        child: Icon(Icons.add),
        onPressed: () => context.go("/product/create"),
      ),
    );
  }
}

class _ProductList extends StatefulWidget {
  const _ProductList();

  @override
  State<_ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<_ProductList> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        switch (state.status) {
          case ProductListStatus.initial:
            return const SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              child: Center(child: CircularProgressIndicator()),
            );
          case ProductListStatus.success:
            if (state.items.isEmpty) {
              return SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: true,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inventory_2_outlined, size: 96),
                      Text(localizations.no_products),
                    ],
                  ),
                ),
              );
            }

            return SliverList.separated(
              itemCount: state.items.length,
              separatorBuilder: (_, index) {
                return const Divider(height: 1);
              },
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.items[index].name),
                  onTap: () {
                    // context.go('/product/see');
                  },
                );
              },
            );
        }
      },
    );
  }
}

// class _ProductSearchAnchor extends StatefulWidget {
//   const _ProductSearchAnchor({super.key});
//
//   @override
//   State<_ProductSearchAnchor> createState() => _ProductSearchState();
// }
//
// class _ProductSearchState extends State<_ProductSearchAnchor> {
//   final SearchController _searchController = SearchController();
//
//   @override
//   Widget build(BuildContext context) {
//     return SearchAnchor(
//       viewPadding: EdgeInsets.zero,
//       isFullScreen: true,
//       textCapitalization: TextCapitalization.characters,
//       searchController: _searchController,
//       builder: (context, controller) {
//         return IconButton(
//           icon: const Icon(Icons.search),
//           onPressed: controller.openView,
//         );
//       },
//       viewBuilder: (_) => Consumer(
//         builder: (_, ref, _) {
//           final asyncValue = ref.watch(
//             productSearchProvider(_searchController.text),
//           );
//
//           return asyncValue.when(
//             data: (items) {
//               if (items.isEmpty) {
//                 // TODO: FIX THIS MF
//                 return Center(child: Text("no data"));
//               }
//
//               return ListView.separated(
//                 padding: EdgeInsets.zero,
//                 itemCount: items.length,
//                 separatorBuilder: (_, index) {
//                   return const Divider();
//                 },
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(items[index].name),
//                     onTap: () {
//                       _searchController.closeView(null);
//                       ref.read(currentProductNotifierProvider.notifier).state =
//                           items[index];
//                       context.go('/product/see');
//                     },
//                   );
//                 },
//               );
//             },
//             loading: () {
//               return Padding(
//                 padding: EdgeInsetsGeometry.all(8),
//                 child: Center(child: const CircularProgressIndicator()),
//               );
//             },
//             error: (err, _) => Text(err.toString()),
//           );
//         },
//       ),
//       suggestionsBuilder: (_, _) => [],
//     );
//   }
// }

class _SliverAppBar extends StatelessWidget {
  final bool innerBoxIsScrolled;
  final void Function() onDelete;

  const _SliverAppBar({
    required this.onDelete,
    this.innerBoxIsScrolled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(AppLocalizations.of(context)!.products),
      // https://m3.material.io/components/app-bars/specs#fac99130-8bb8-498c-8cb8-16ea056cc3e1
      actionsPadding: EdgeInsets.symmetric(horizontal: 4),
      //actions: [_ProductSearchAnchor(), CitySearchAnchor()],
      floating: true,
      pinned: true,
      snap: true,
      // The "forceElevated" property causes the SliverAppBar to show
      // a shadow. The "innerBoxIsScrolled" parameter is true when the
      // inner scroll view is scrolled beyond its "zero" point, i.e.
      // when it appears to be scrolled below the SliverAppBar.
      // Without this, there are cases where the shadow would appear
      // or not appear inappropriately, because the SliverAppBar is
      // not actually aware of the precise position of the inner
      // scroll views.
      forceElevated: innerBoxIsScrolled,
    );
  }
}
