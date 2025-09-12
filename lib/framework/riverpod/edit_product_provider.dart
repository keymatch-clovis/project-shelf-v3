import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/common/custom_state_error.dart';
import 'package:project_shelf_v3/adapter/common/extension/currency_extension.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/adapter/common/validator/currency_validator.dart';
import 'package:project_shelf_v3/adapter/common/validator/int_validator.dart';
import 'package:project_shelf_v3/adapter/common/validator/string_validator.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/use_case/product/search_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/update_product_use_case.dart';
import 'package:project_shelf_v3/common/debouncer.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/selected_product_provider.dart';
import 'package:project_shelf_v3/main.dart';

part 'edit_product_provider.freezed.dart';

/// State related
enum EditProductStatus { initial, loading, success }

@freezed
abstract class EditProductState with _$EditProductState {
  const factory EditProductState({
    @Default(EditProductStatus.initial) EditProductStatus status,
    required Product product,
    required Input nameInput,
    required Input defaultPriceInput,
    required Input purchasePriceInput,
    required Input stockInput,
    @Default([]) List<File> photoFiles,
  }) = _EditProductState;

  const EditProductState._();

  // Computed properties
  bool get isValid => <bool>[
    nameInput.errors.isEmpty,
    defaultPriceInput.errors.isEmpty,
    stockInput.errors.isEmpty,
    status == EditProductStatus.initial,
  ].every((el) => el);
}

/// Provider related
class EditProductAsyncNotifier extends AsyncNotifier<EditProductState> {
  final _searchProductUseCase = getIt.get<SearchProductUseCase>();
  final _updateProductUseCase = getIt.get<UpdateProductUseCase>();
  final _debouncer = Debouncer();

  @override
  FutureOr<EditProductState> build() async {
    final appPreferences = await ref.watch(appPreferencesProvider.future);

    final selectedProductState = ref.watch(selectedProductProvider);
    assert(selectedProductState is Selected);

    final product = (selectedProductState as Selected).product;

    return EditProductState(
      product: product,
      nameInput: Input(StringValidator(isRequired: true), value: product.name),
      defaultPriceInput: Input(
        CurrencyValidator(appPreferences.defaultCurrency),
        value: product.defaultPrice.minorUnits > BigInt.zero
            ? product.defaultPrice.minorUnits.toString()
            : null,
      ),
      purchasePriceInput: Input(
        CurrencyValidator(appPreferences.defaultCurrency),
        value: product.purchasePrice.minorUnits > BigInt.zero
            ? product.purchasePrice.minorUnits.toString()
            : null,
      ),
      stockInput: Input(
        IntValidator(),
        value: product.stock > 0 ? product.stock.toString() : null,
      ),
    );
  }

  Future<void> updateName(String value) async {
    await future;

    state = AsyncData(
      state.value!.copyWith(
        status: EditProductStatus.loading,
        nameInput: state.value!.nameInput.copyWith(value: value),
      ),
    );

    _debouncer.debounce(() => _searchProductUseCase.exec(name: value));
    await _debouncer.completer.future.then((it) {
      if (it != null) {
        state = AsyncData(
          state.value!.copyWith(
            nameInput: state.value!.nameInput.copyWith(
              errors: state.value!.nameInput.errors
                ..add(CustomStateError.productNameTaken),
            ),
          ),
        );
      }
    });

    state = AsyncData(state.value!.copyWith(status: EditProductStatus.initial));
  }

  Future<void> updateDefaultPrice(String value) async {
    await future;

    state = AsyncData(
      state.value!.copyWith(
        defaultPriceInput: state.value!.defaultPriceInput.copyWith(
          value: value,
        ),
      ),
    );
  }

  Future<void> updatePurchasePrice(String value) async {
    await future;

    state = AsyncData(
      state.value!.copyWith(
        purchasePriceInput: state.value!.purchasePriceInput.copyWith(
          value: value,
        ),
      ),
    );
  }

  Future<void> updateStock(String value) async {
    await future;

    state = AsyncData(
      state.value!.copyWith(
        stockInput: state.value!.stockInput.copyWith(value: value),
      ),
    );
  }

  Future<void> edit() async {
    await future;
    assert(state.value!.isValid);

    final appPreferences = await ref.watch(appPreferencesProvider.future);

    state = AsyncData(state.value!.copyWith(status: EditProductStatus.loading));

    await _updateProductUseCase
        .exec(
          Args(
            id: state.value!.product.id,
            name: state.value!.nameInput.value.trim(),
            defaultPrice: appPreferences.defaultCurrency.tryParse(
              state.value!.defaultPriceInput.value,
            ),
            purchasePrice: appPreferences.defaultCurrency.tryParse(
              state.value!.purchasePriceInput.value,
            ),
            stock: int.tryParse(state.value!.stockInput.value),
          ),
        )
        .then((it) {
          ref.read(selectedProductProvider.notifier).select(it);
        });

    state = AsyncData(state.value!.copyWith(status: EditProductStatus.success));
  }
}

final editProductProvider = AsyncNotifierProvider.autoDispose(
  EditProductAsyncNotifier.new,
);
