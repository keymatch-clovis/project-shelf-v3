import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_event.dart';
import 'package:project_shelf_v3/adapter/view_model/product/delete_product_view_model.dart';
import 'package:project_shelf_v3/adapter/view_model/product/edit_product_view_model.dart';
import 'package:project_shelf_v3/adapter/view_model/product/see_product_view_model.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/comon/typedefs.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/ui/components/dialog/accept_dialog.dart';
import 'package:project_shelf_v3/framework/ui/components/product_form.dart';

class SeeProductScreen extends ConsumerStatefulWidget {
  final Id id;

  const SeeProductScreen(this.id, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SeeProductScreenState();
}

class _SeeProductScreenState extends ConsumerState<SeeProductScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (FocusScope.of(context).hasFocus) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productAsync = ref.watch(seeProductProvider(widget.id));

    return Scaffold(
      body: productAsync.when(
        data: (data) => _renderData(data, context, ref),
        loading: () => _renderLoading(context, ref),
        error: (err, _) {
          Logger().f(err);
          throw AssertionError(err);
        },
      ),
    );
  }

  Widget _renderData(Product product, BuildContext context, WidgetRef ref) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    final deleteViewModel = ref.watch(
      deleteProductViewModelProvider(product).notifier,
    );

    /// Events related
    ref.listen<ViewModelEvent?>(deleteProductViewModelEventProvider, (
      _,
      event,
    ) {
      if (event is ProductDeleted) {
        context.go("/product");
      }

      // Always clear the event after it has been read.
      ref.read(deleteProductViewModelEventProvider.notifier).state = null;
    });

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
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
                pinned: true,
                // The "forceElevated" property causes the SliverAppBar to show
                // a shadow. The "innerBoxIsScrolled" parameter is true when the
                // inner scroll view is scrolled beyond its "zero" point, i.e.
                // when it appears to be scrolled below the SliverAppBar.
                // Without this, there are cases where the shadow would appear
                // or not appear inappropriately, because the SliverAppBar is
                // not actually aware of the precise position of the inner
                // scroll views.
                forceElevated: innerBoxIsScrolled,
                title: Text(AppLocalizations.of(context)!.product),
                // https://m3.material.io/components/app-bars/specs#fac99130-8bb8-498c-8cb8-16ea056cc3e1
                actionsPadding: EdgeInsets.symmetric(horizontal: 12),
                actions: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AcceptDialog(
                          title: '${localizations.delete_product}?',
                          body: localizations.this_action_cannot_be_undone,
                          onAccept: deleteViewModel.delete,
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete_outline_rounded),
                  ),
                ],
                bottom: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(icon: Icon(Icons.data_object_rounded)),
                    Tab(icon: Icon(Icons.receipt_long_rounded)),
                    Tab(icon: Icon(Icons.group_outlined)),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: _tabController,
            children: [
              // EditProductForm(product),
              // SliverFillRemaining(
              //   hasScrollBody: false,
              //   child: Center(child: _ComingSoonIcon()),
              // ),

              // This Builder is needed to provide a BuildContext that is
              // "inside" the NestedScrollView, so that
              // sliverOverlapAbsorberHandleFor() can find the NestedScrollView.
              Builder(
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
                        child: _EditProductForm(product),
                      ),
                    ],
                  );
                },
              ),
              Builder(
                builder: (context) {
                  return CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context,
                        ),
                      ),
                      SliverFillRemaining(
                        child: Center(child: _ComingSoonIcon()),
                      ),
                    ],
                  );
                },
              ),
              Builder(
                builder: (context) {
                  return CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context,
                        ),
                      ),
                      SliverFillRemaining(
                        child: Center(child: _ComingSoonIcon()),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderLoading(BuildContext context, WidgetRef ref) {
    return Center(child: const CircularProgressIndicator());
  }
}

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

class _EditProductForm extends ConsumerWidget {
  final Product _product;

  const _EditProductForm(this._product);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(editProductViewModelProvider(_product).notifier);
    final state = ref.watch(editProductViewModelProvider(_product));

    /// Event related
    ref.listen<ViewModelEvent?>(editProductViewModelEventProvider, (_, event) {
      if (event is ProductEdited) {
        // TODO: Replace old product with new one?
      }

      // Always clear the event after it has been read.
      ref.read(editProductViewModelEventProvider.notifier).state = null;
    });

    return ProductForm(
      nameInput: state.name,
      onNameChanged: viewModel.updateName,
      defaultPriceInput: state.defaultPrice,
      onDefaultPriceChanged: viewModel.updateDefaultPrice,
      stockInput: state.stock,
      onStockChanged: viewModel.updateStock,
    );
  }
}
