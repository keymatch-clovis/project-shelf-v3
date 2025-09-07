import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/ui_controller/product/product_create_controller.dart';
import 'package:project_shelf_v3/framework/ui/components/product_form.dart';

class CreateProductScreen extends ConsumerWidget {
  const CreateProductScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Controller related
    final controller = ref.read(productCreateControllerProvider.notifier);
    final state = ref.watch(productCreateControllerProvider);

    // /// Events related
    // ref.listen<ViewModelEvent?>(createProductViewModelEventProvider, (
    //   _,
    //   event,
    // ) {
    //   if (event is ProductCreated) {
    //     context.go("/product");
    //   }
    //
    //   // Always clear the event after it has been read.
    //   ref.read(createProductViewModelEventProvider.notifier).state = null;
    // });

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.add_product),
        // https://m3.material.io/components/app-bars/specs#fac99130-8bb8-498c-8cb8-16ea056cc3e1
        actionsPadding: EdgeInsets.symmetric(horizontal: 12),
        actions: [
          FilledButton(
            onPressed: state.isValid ? controller.create : null,
            child: Text(AppLocalizations.of(context)!.save),
          ),
        ],
      ),
      body: ProductForm(
        nameInput: state.name,
        onNameChanged: controller.updateName,
        defaultPriceInput: state.defaultPrice,
        onDefaultPriceChanged: controller.updateDefaultPrice,
        stockInput: state.stock,
        onStockChanged: controller.updateStock,
      ),
    );
  }
}
