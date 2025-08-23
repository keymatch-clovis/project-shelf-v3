import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/view_model/product/see_product_view_model.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

class SeeProductScreen extends ConsumerWidget {
  final Product product;

  const SeeProductScreen(this.product, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(seeProductProvider(product.id));

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
              sliver: SliverAppBar(
                title: Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_outline_rounded),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined)),
                ],
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
                bottom: _renderLoadingBar(productAsync),
              ),
            ),
          ];
        },
        body: SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (context) {
              return CustomScrollView(
                slivers: [
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                      context,
                    ),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    fillOverscroll: true,
                    child: const Text('test'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget? _renderLoadingBar(AsyncValue value) {
  return value.maybeWhen(
    loading: () {
      return PreferredSize(
        preferredSize: Size.fromHeight(12),
        child: Column(children: [const LinearProgressIndicator()]),
      );
    },
    orElse: () => null,
  );
}

// class _SeeProductScreenState extends ConsumerState<SeeProductScreen> {
//   Widget _renderData(Product product, BuildContext context, WidgetRef ref) {
//     final AppLocalizations localizations = AppLocalizations.of(context)!;

//     final deleteViewModel = ref.watch(
//       deleteProductViewModelProvider(product).notifier,
//     );

//     /// Events related
//     ref.listen<ViewModelEvent?>(deleteProductViewModelEventProvider, (
//       _,
//       event,
//     ) {
//       if (event is ProductDeleted) {
//         context.go("/product");
//       }

//       // Always clear the event after it has been read.
//       ref.read(deleteProductViewModelEventProvider.notifier).state = null;
//     });
//   }

//   Widget _renderLoading(BuildContext context, WidgetRef ref) {
//     return Center(child: const CircularProgressIndicator());
//   }
// }

class _ComingSoonIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.electrical_services_rounded,
          size: 96,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        Text(AppLocalizations.of(context)!.coming_soon),
      ],
    );
  }
}
