import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/view_model/common/extension/currency_extension.dart';
import 'package:project_shelf_v3/adapter/view_model/common/input.dart';
import 'package:project_shelf_v3/adapter/view_model/common/validator/int_validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/validator/currency_validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/validator/string_validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_error.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_event.dart';
import 'package:project_shelf_v3/framework/riverpod/use_case_provider.dart';

part 'create_product_view_model.freezed.dart';

@freezed
abstract class CreateProductViewModelState with _$CreateProductViewModelState {
  const factory CreateProductViewModelState({
    @Default(false) bool isLoading,
    required Input name,
    required Input defaultPrice,
    required Input stock,
  }) = _CreateProductViewModelState;

  const CreateProductViewModelState._();

  /// Computed properties
  bool get isValid {
    return name.errors.isEmpty &&
        defaultPrice.errors.isEmpty &&
        stock.errors.isEmpty &&
        !isLoading;
  }
}

class CreateProductViewModel extends Notifier<CreateProductViewModelState> {
  @override
  CreateProductViewModelState build() {
    // FIXME: This should be different.
    final currency = Currency.create('COP', 0, pattern: '#,##0');

    return CreateProductViewModelState(
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
    Logger().d("[VIEW-MODEL] Creating product");
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

    ref.read(createProductViewModelEventProvider.notifier).state =
        ProductCreated();
  }

  Future<void> _checkNameIsUnique() async {
    state = state.copyWith(isLoading: true);

    final foundProduct = await ref
        .read(searchProductUseCaseProvider)
        .exec(name: state.name.value);

    if (foundProduct != null) {
      state.name.errors.add(ViewModelError.productNameTaken);
    }

    state = state.copyWith(isLoading: false);
    ref.notifyListeners();
  }
}

/// View Model provider
final createProductViewModelProvider =
    NotifierProvider.autoDispose<
      CreateProductViewModel,
      CreateProductViewModelState
    >(() {
      return CreateProductViewModel();
    });

/// Events
class ProductCreated implements ViewModelEvent {}

final createProductViewModelEventProvider = StateProvider<ViewModelEvent?>(
  (_) => null,
  isAutoDispose: true,
);
