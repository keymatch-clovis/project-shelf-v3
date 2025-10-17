import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/product/create_product_provider.dart';
import 'package:project_shelf_v3/framework/ui/components/product_details_form.dart';
import 'package:project_shelf_v3/framework/ui/components/product_images_form.dart';

class CreateProductScreen extends ConsumerStatefulWidget {
  const CreateProductScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateProductScreenState();
}

final class _CreateProductScreenState extends ConsumerState<CreateProductScreen>
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

    ref.listen(createProductProvider.selectAsync((it) => it.status), (
      _,
      state,
    ) {
      state.then((it) {
        if (it == CreateProductStatus.success) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                showCloseIcon: true,
                content: Text(localizations.product_created),
              ),
            );

            context.pop();
          }
        }
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.add_product),
        actions: [_CreateAction()],
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
        children: [_DetailsForm(), _ImagesForm()],
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _tabController.animation!,
        builder: (context, _) {
          final tab = _tabController.animation!.value.round();
          return _FabRenderer(tab);
        },
      ),
    );
  }
}

class _FabRenderer extends ConsumerWidget {
  final int tab;

  const _FabRenderer(this.tab);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (tab) {
      1 => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 16,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.photo_library_rounded),
          ),
          FloatingActionButton.large(
            onPressed: ref.read(createProductProvider.notifier).openCamera,
            child: Icon(Icons.camera_alt_rounded),
          ),
        ],
      ),
      _ => const SizedBox.shrink(),
    };
  }
}

class _DetailsForm extends ConsumerWidget {
  const _DetailsForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appPreferences = ref.watch(appPreferencesProvider);
    final state = ref.watch(createProductProvider);

    if (appPreferences.isLoading || state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      child: ProductDetailsForm(
        currency: appPreferences.value!.defaultCurrency,
        nameInput: state.value!.nameInput,
        onNameChanged: ref.read(createProductProvider.notifier).updateName,
        defaultPriceInput: state.value!.defaultPriceInput,
        onDefaultPriceChanged: ref
            .read(createProductProvider.notifier)
            .updateDefaultPrice,
        purchasePriceInput: state.value!.purchasePriceInput,
        onPurchasePriceChanged: ref
            .read(createProductProvider.notifier)
            .updatePurchasePrice,
        stockInput: state.value!.stockInput,
        onStockChanged: ref.read(createProductProvider.notifier).updateStock,
      ),
    );
  }
}

class _ImagesForm extends ConsumerWidget {
  const _ImagesForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      createProductProvider.select((it) {
        return it.whenData((it) {
          return it.photoFiles;
        });
      }),
    );

    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return ProductImagesForm(state.value!);
  }
}

class _CreateAction extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(createProductProvider);

    return state.when(
      data: (data) {
        return FilledButton(
          onPressed: data.isValid
              ? ref.read(createProductProvider.notifier).create
              : null,
          key: const ValueKey('save'),
          child: Text(localizations.save),
        );
      },
      // https://stackoverflow.com/questions/53455358/how-to-present-an-empty-view-in-flutter
      loading: () => const SizedBox.shrink(),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
    );
  }
}
