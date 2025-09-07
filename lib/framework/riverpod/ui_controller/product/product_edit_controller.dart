import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/custom_state_error.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/extension/currency_extension.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/input.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/validator/currency_validator.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/validator/int_validator.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/validator/string_validator.dart';
import 'package:project_shelf_v3/adapter/ui_state/product/product_edit_state.dart';
import 'package:project_shelf_v3/framework/riverpod/ui_controller/product/current_product_controller.dart';
import 'package:project_shelf_v3/framework/riverpod/use_case_provider.dart';

final productEditControllerProvider =
    NotifierProvider.autoDispose<ProductEditController, ProductEditState>(
      ProductEditController.new,
    );

class ProductEditController extends Notifier<ProductEditState> {
  @override
  ProductEditState build() {
    // NOTE: Notice the null-check assertion operator---We need to make sure
    // we are creating this controller only when we have a product selected
    // with the dependency provider.
    final product = ref.watch(currentProductNotifierProvider)!;

    // FIXME: This should be different.
    final currency = Currency.create('COP', 0, pattern: '#,##0');

    return ProductEditState(
      currency: currency,
      product: product,
      name: product.name.toInput(StringValidator(isRequired: true)),
      defaultPrice: product.defaultPrice.toInput(CurrencyValidator(currency)),
      stock: product.stock.toInput(IntValidator()),
    );
  }

  Future<void> updateName(String value) async {
    state = state.copyWith(
      name: state.name.copyWith(value: value, errors: {}),
    );

    _checkNameIsUnique();
  }

  Future<void> updateDefaultPrice(String value) async {
    state = state.copyWith(
      defaultPrice: state.defaultPrice.copyWith(value: value, errors: {}),
    );
  }

  Future<void> updateStock(String value) async {
    state = state.copyWith(
      stock: state.stock.copyWith(value: value, errors: {}),
    );
  }

  Future<void> edit() async {
    assert(state.isValid);

    // FIXME: This should be different.
    final currency = Currency.create('COP', 0, pattern: '#,##0');

    final product = await ref
        .read(updateProductUseCaseProvider)
        .exec(
          id: state.product.id,
          name: state.name.value,
          defaultPrice: currency.tryParse(state.defaultPrice.value),
          stock: int.tryParse(state.stock.value),
        )
        .then((entity) => entity.toDto());

    // Update the current product we are editing to notify other screens about
    // this change.
    ref.read(currentProductNotifierProvider.notifier).state = product;
  }

  Future<void> _checkNameIsUnique() async {
    // Short-circuit a search if the editing name is the same as the current
    // one.
    if (state.product.name == state.name.value) {
      return;
    }

    state = state.copyWith(isLoading: true);

    final foundProduct = await ref
        .read(searchProductUseCaseProvider)
        .exec(name: state.name.value);

    if (foundProduct != null) {
      state = state.copyWith(
        name: state.name.copyWith(errors: {CustomStateError.productNameTaken}),
      );
    }

    state = state.copyWith(isLoading: false);
  }
}
