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
    extends FamilyAsyncNotifier<EditProductViewModelState, Product> {
  @override
  Future<EditProductViewModelState> build(Product product) async {
    final Product found = await ref
        .read(findProductUseCaseProvider)
        .exec(id: product.id);

    // FIXME: This should be different.
    final currency = Currency.create('COP', 0, pattern: '#,##0');

    return EditProductViewModelState(
      product: product,
      name: Input(StringValidator(isRequired: true), value: found.name),
      defaultPrice: Input(
        CurrencyValidator(currency),
        value: found.defaultPrice.amount.minorUnits.toString(),
      ),
      stock: Input(IntValidator(), value: found.stock.toString()),
    );
  }

  Future<void> updateName(String value) async {
    final old = await future;
    state = AsyncData(old.copyWith(name: old.name.copyWith(value: value)));

    _checkNameIsUnique();

    ref.notifyListeners();
  }

  Future<void> updateDefaultPrice(String value) async {
    final old = await future;

    state = AsyncData(
      old.copyWith(defaultPrice: old.defaultPrice.copyWith(value: value)),
    );
    ref.notifyListeners();
  }

  Future<void> updateStock(String value) async {
    final old = await future;

    state = AsyncData(old.copyWith(stock: old.stock.copyWith(value: value)));
    ref.notifyListeners();
  }

  Future<void> edit() async {
    final state = (await future);

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

  Future<void> _checkNameIsUnique() async {
    // Always wait for the future to finish loading, if it is loading.
    final old = await future;

    // Short-circuit a search if the editing name is the same as the current
    // one.
    if (old.product.name == old.name.value) {
      return;
    }

    state = AsyncData(old.copyWith(isLoading: true));

    final foundProduct = await ref
        .read(searchProductUseCaseProvider)
        .exec(name: old.name.value);

    if (foundProduct != null) {
      state = AsyncData(
        old.copyWith(
          name: old.name.copyWith(errors: {ViewModelError.productNameTaken}),
        ),
      );
      ref.notifyListeners();
    }
  }
}

/// Provider
final editProductViewModelProvider = AsyncNotifierProvider.autoDispose
    .family<EditProductViewModel, EditProductViewModelState, Product>(() {
      return EditProductViewModel();
    });

/// Events
final editProductViewModelEventProvider = StateProvider<ViewModelEvent?>(
  (_) => null,
  isAutoDispose: true,
);

class ProductEdited implements ViewModelEvent {}
