import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/common/custom_state_error.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/adapter/common/validator/currency_validator.dart';
import 'package:project_shelf_v3/adapter/common/validator/int_validator.dart';
import 'package:project_shelf_v3/adapter/common/validator/string_validator.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/app/dto/update_product_request.dart';
import 'package:project_shelf_v3/app/use_case/product/search_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/update_product_use_case.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/common/debouncer.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/product/selected_product_provider.dart';
import 'package:project_shelf_v3/main.dart';

part 'edit_product_provider.freezed.dart';

/// State related
enum EditProductStatus { initial, loading, success }

@freezed
abstract class EditProductState with _$EditProductState {
  const factory EditProductState({
    @Default(EditProductStatus.initial) EditProductStatus status,
    required Currency currency,
    required ProductDto product,
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
      currency: appPreferences.defaultCurrency,
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
    final value = await future;
    assert(value.isValid);

    state = AsyncData(value.copyWith(status: EditProductStatus.loading));

    await _updateProductUseCase
        .exec(
          UpdateProductRequest(
            id: value.product.id,
            name: value.nameInput.value.trim(),
            defaultPrice: value.currency.tryParse(
              value.defaultPriceInput.value,
            ),
            purchasePrice: value.currency.tryParse(
              value.purchasePriceInput.value,
            ),
            stock: int.tryParse(value.stockInput.value),
          ),
        )
        .then((it) {
          ref
              .read(selectedProductProvider.notifier)
              .select(ProductDto.fromEntity(it));
        });

    state = AsyncData(state.value!.copyWith(status: EditProductStatus.success));
  }
}

final editProductProvider = AsyncNotifierProvider.autoDispose(
  EditProductAsyncNotifier.new,
);
