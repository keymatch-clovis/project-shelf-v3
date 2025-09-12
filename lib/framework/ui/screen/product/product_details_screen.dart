import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/selected_product_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/currency_input_formatter.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_text_field.dart';
import 'package:project_shelf_v3/framework/ui/components/dialog/accept_dialog.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: [
                _SliverAppBar(),
                SliverFillRemaining(
                  hasScrollBody: false,
                  fillOverscroll: true,
                  child: const Column(children: [_ProductDetails()]),
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
  const _SliverAppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.read(selectedProductProvider);

    return switch (state) {
      None() => throw AssertionError(),
      Selected() => SliverAppBar.medium(
        title: Text(
          state.dto.name,
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
              context.go('/product/see/edit');
            },
          ),
        ],
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

    return switch (state) {
      None() => throw AssertionError(),
      Selected() => Padding(
        // https://m3.material.io/components/dialogs/specs#2b93ced7-9b0d-4a59-9bc4-8ff59dcd24c1
        padding: EdgeInsetsGeometry.all(24),
        child: Column(
          spacing: 12,
          children: [
            CustomTextField(
              required: true,
              readOnly: true,
              initialValue: state.dto.name,
              label: localizations.name,
            ),
            CustomTextField(
              required: true,
              readOnly: true,
              initialValue: state.dto.defaultPrice?.toString() ?? "",
              label: localizations.default_price,
              inputFormatters: [
                CurrencyInputFormatter(
                  currency: appPreferences.value!.defaultCurrency,
                ),
              ],
            ),
          ],
        ),
      ),
    };
  }
}
