import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/custom_state_error.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/extension/currency_extension.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/input.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/validator/currency_validator.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/validator/int_validator.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/validator/string_validator.dart';
import 'package:project_shelf_v3/adapter/ui_state/product/product_create_state.dart';
import 'package:project_shelf_v3/framework/riverpod/use_case_provider.dart';

final productCreateControllerProvider =
    NotifierProvider<ProductCreateController, ProductCreateState>(
      ProductCreateController.new,
    );

class ProductCreateController extends Notifier<ProductCreateState> {
  @override
  ProductCreateState build() {
    // FIXME: This should be different.
    final currency = Currency.create('COP', 0, pattern: '#,##0');

    return ProductCreateState(
      name: Input(StringValidator(isRequired: true)),
      defaultPrice: Input(CurrencyValidator(currency)),
      stock: Input(IntValidator()),
    );
  }

  void updateName(String value) {
    state = state.copyWith(
      name: state.name.copyWith(value: value, errors: {}),
    );

    _checkNameIsUnique();

    ref.notifyListeners();
  }

  void updateDefaultPrice(String value) {
    state = state.copyWith(
      defaultPrice: state.defaultPrice.copyWith(value: value, errors: {}),
    );
    ref.notifyListeners();
  }

  void updateStock(String value) {
    state = state.copyWith(
      stock: state.stock.copyWith(value: value, errors: {}),
    );
    ref.notifyListeners();
  }

  Future<void> create() async {
    assert(state.isValid);

    // FIXME: This should be different.
    final currency = Currency.create('COP', 0, pattern: '#,##0');

    await ref
        .read(createProductUseCaseProvider)
        .exec(
          name: state.name.value,
          defaultPrice: currency.tryParse(state.defaultPrice.value),
          stock: int.tryParse(state.stock.value),
        );
    // TODO: emit event
  }

  Future<void> _checkNameIsUnique() async {
    state = state.copyWith(isLoading: true);
    ref.notifyListeners();

    final foundProduct = await ref
        .read(searchProductUseCaseProvider)
        .exec(name: state.name.value);

    if (foundProduct != null) {
      state.name.errors.add(CustomStateError.productNameTaken);
    }

    state = state.copyWith(isLoading: false);
    ref.notifyListeners();
  }
}
