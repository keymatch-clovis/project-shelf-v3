import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_event.dart';
import 'package:project_shelf_v3/adapter/view_model/product/edit_product_view_model.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/framework/ui/components/product_form.dart';

class EditProductScreen extends ConsumerWidget {
  final Product product;

  const EditProductScreen(this.product, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(editProductViewModelProvider(product).notifier);
    final state = ref.watch(editProductViewModelProvider(product));

return Text('test');
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
