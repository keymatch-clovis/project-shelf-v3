import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/view_model/common/extension/currency_extension.dart';
import 'package:project_shelf_v3/adapter/view_model/common/input.dart';
import 'package:project_shelf_v3/adapter/view_model/common/validator/currency_validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/validator/int_validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/validator/string_validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_error.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_event.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/framework/riverpod/use_case_provider.dart';

part 'edit_product_view_model.freezed.dart';

@freezed
abstract class EditProductViewModelState with _$EditProductViewModelState {
  const factory EditProductViewModelState({
    @Default(false) bool isLoading,
    required Product product,
    required Input name,
    required Input defaultPrice,
    required Input stock,
  }) = _EditProductViewModelState;

  const EditProductViewModelState._();

  /// Computed properties
  bool get isValid {
    return name.errors.isEmpty &&
        defaultPrice.errors.isEmpty &&
        stock.errors.isEmpty &&
        !isLoading;
  }
}

class EditProductViewModel
    extends FamilyNotifier<EditProductViewModelState, Product> {
  @override
  EditProductViewModelState build(Product product) {
    // FIXME: This should be different.
    final currency = Currency.create('COP', 0, pattern: '#,##0');

    return EditProductViewModelState(
      product: product,
      name: Input(StringValidator(isRequired: true), value: product.name),
      defaultPrice: Input(
        CurrencyValidator(currency),
        value: product.defaultPrice.amount.minorUnits.toString(),
      ),
      stock: Input(IntValidator(), value: product.stock.toString()),
    );
  }

  void updateName(String value) {
    state.name.update(value);
    _checkNameIsUnique();
    ref.notifyListeners();
  }

  void updateDefaultPrice(String value) {
    state.defaultPrice.update(value);
    ref.notifyListeners();
  }

  void updateStock(String value) {
    state.stock.update(value);
    ref.notifyListeners();
  }

  Future<void> edit() async {
    Logger().d("[VIEW-MODEL] Updating product");
    assert(state.isValid);

    // FIXME: This should be different.
    final currency = Currency.create('COP', 0, pattern: '#,##0');

    await ref
        .read(updateProductUseCaseProvider)
        .exec(
          id: state.product.id,
          name: state.name.value,
          defaultPrice: currency.tryParse(state.defaultPrice.value),
          stock: int.tryParse(state.stock.value),
        );

    ref.read(editProductViewModelEventProvider.notifier).state =
        ProductEdited();
  }

  void _checkNameIsUnique() {
    // Short-circuit a search if the editing name is the same as the current
    // one.
    if (state.product.name == state.name.value) {
      return;
    }

    state = state.copyWith(isLoading: true);

    ref.read(searchProductUseCaseProvider).exec(name: state.name.value).then((
      product,
    ) {
      if (product != null) {
        state.name.errors.add(ViewModelError.productNameTaken);
      }

      state = state.copyWith(isLoading: false);
      ref.notifyListeners();
    });
  }
}

/// Provider
final editProductViewModelProvider = NotifierProvider.autoDispose
    .family<EditProductViewModel, EditProductViewModelState, Product>(() {
      return EditProductViewModel();
    });

/// Events
final editProductViewModelEventProvider = StateProvider<ViewModelEvent?>(
  (_) => null,
  isAutoDispose: true,
);

class ProductEdited implements ViewModelEvent {}
