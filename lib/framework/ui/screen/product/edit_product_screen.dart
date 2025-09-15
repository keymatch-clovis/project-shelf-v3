import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/product/edit_product_provider.dart';
import 'package:project_shelf_v3/framework/ui/components/product_details_form.dart';

class EditProductScreen extends ConsumerStatefulWidget {
  const EditProductScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProductScreenState();
}

final class _EditProductScreenState extends ConsumerState<EditProductScreen>
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

    ref.listen(editProductProvider.selectAsync((it) => it.status), (_, state) {
      state.then((it) {
        if (it == EditProductStatus.success) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                showCloseIcon: true,
                content: Text(localizations.product_edited),
              ),
            );

            context.pop();
          }
        }
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.edit_product),
        actions: [_EditAction()],
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
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _DetailsForm(),
          const Center(child: Text("Comming Soon 😊")),
        ],
      ),
    );
  }
}

class _DetailsForm extends ConsumerWidget {
  const _DetailsForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appPreferences = ref.watch(appPreferencesProvider);
    final state = ref.watch(editProductProvider);

    if (appPreferences.isLoading || state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ProductDetailsForm(
      currency: appPreferences.value!.defaultCurrency,
      nameInput: state.value!.nameInput,
      onNameChanged: ref.read(editProductProvider.notifier).updateName,
      defaultPriceInput: state.value!.defaultPriceInput,
      onDefaultPriceChanged: ref
          .read(editProductProvider.notifier)
          .updateDefaultPrice,
      purchasePriceInput: state.value!.purchasePriceInput,
      onPurchasePriceChanged: ref
          .read(editProductProvider.notifier)
          .updatePurchasePrice,
      stockInput: state.value!.stockInput,
      onStockChanged: ref.read(editProductProvider.notifier).updateStock,
    );
  }
}

class _EditAction extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(editProductProvider);

    return state.when(
      data: (data) {
        return FilledButton(
          onPressed: data.isValid
              ? ref.read(editProductProvider.notifier).edit
              : null,
          child: Text(localizations.save),
        );
      },
      // https://stackoverflow.com/questions/53455358/how-to-present-an-empty-view-in-flutter
      loading: () => const SizedBox.shrink(),
      error: (err, _) => throw AssertionError(err),
    );
  }
}
