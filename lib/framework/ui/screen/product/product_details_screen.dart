import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/product/selected_product_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/currency_input_formatter.dart';
import 'package:project_shelf_v3/framework/ui/components/shelf_text_field.dart';
import 'package:project_shelf_v3/framework/ui/components/dialog/accept_dialog.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

class ProductDetailsScreen extends ConsumerStatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends ConsumerState<ProductDetailsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    ref.listen(selectedProductProvider.select((it) => it.status), (_, state) {
      switch (state) {
        case SelectedProductStatus.DELETED:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(localizations.product_deleted)),
          );

          context.pop();
        default:
        // Do nothing. :p
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: [
                _SliverAppBar(_tabController),
                SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: true,
                  // NOTE: I don't really know why this works. This might be
                  // problematic in the future. So take note of this.
                  child: SizedBox.shrink(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _ProductDetails(),
                        const Center(child: Text("Comming Soon 😊")),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SliverAppBar extends ConsumerWidget {
  final TabController _tabController;

  const _SliverAppBar(this._tabController);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(selectedProductProvider);

    return switch (state) {
      NoneState() => throw AssertionError(),
      SelectedState() => SliverAppBar.medium(
        title: Text(
          state.product.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outline_rounded),
            onPressed: () => showDialog(
              context: context,
              builder: (context) {
                return AcceptDialog(
                  title: localizations.delete_product,
                  onAccept: ref.read(selectedProductProvider.notifier).delete,
                );
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: () {
              context.go(CustomRoute.PRODUCT_EDIT.route);
            },
          ),
        ],
        bottom: TabBar.secondary(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.notes_rounded), text: localizations.details),
            Tab(
              icon: Icon(Icons.photo_library_rounded),
              text: localizations.photos,
            ),
          ],
        ),
        floating: true,
        pinned: true,
        snap: true,
      ),
    };
  }
}

final class _ProductDetails extends ConsumerWidget {
  const _ProductDetails();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    final appPreferences = ref.watch(appPreferencesProvider);
    final state = ref.watch(selectedProductProvider);

    if (appPreferences.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final currencyInputFormatter = CurrencyInputFormatter(
      currency: appPreferences.value!.defaultCurrency,
    );

    return switch (state) {
      NoneState() => throw AssertionError(),
      SelectedState() => SingleChildScrollView(
        child: Padding(
          // https://m3.material.io/components/dialogs/specs#2b93ced7-9b0d-4a59-9bc4-8ff59dcd24c1
          padding: EdgeInsetsGeometry.all(24),
          child: Column(
            spacing: 12,
            children: [
              ShelfTextField(
                isRequired: true,
                readOnly: true,
                value: Some(state.product.name),
                label: localizations.name,
              ),
              ShelfTextField(
                isRequired: true,
                readOnly: true,
                value: Some(state.product.defaultPrice.toString()),
                label: localizations.default_price,
                inputFormatters: [currencyInputFormatter],
              ),
              ShelfTextField(
                isRequired: true,
                readOnly: true,
                value: Some(state.product.purchasePrice.toString()),
                label: localizations.purchase_price,
                inputFormatters: [currencyInputFormatter],
              ),
              ShelfTextField(
                isRequired: true,
                readOnly: true,
                value: Some(state.product.stock.toString()),
                label: localizations.stock,
              ),
            ],
          ),
        ),
      ),
    };
  }
}
