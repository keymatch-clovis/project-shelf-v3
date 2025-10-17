import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_integer_rule.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_money_rule.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_required_rule.dart';
import 'package:project_shelf_v3/adapter/common/validator/validation_error.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/app/dto/update_product_request.dart';
import 'package:project_shelf_v3/app/use_case/product/search_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/update_product_use_case.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/common/debouncer.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/product/selected_product_provider.dart';
import 'package:project_shelf_v3/injectable.dart';

part 'edit_product_provider.freezed.dart';

/// State related
enum EditProductStatus { INITIAL, LOADING, SUCCESS }

@freezed
abstract class EditProductState with _$EditProductState {
  const factory EditProductState({
    @Default(EditProductStatus.INITIAL) EditProductStatus status,
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
    status == EditProductStatus.INITIAL,
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
    final isMoneyRule = IsMoneyRule(appPreferences.defaultCurrency);

    return EditProductState(
      currency: appPreferences.defaultCurrency,
      product: product,
      nameInput: Input(
        value: product.name,
        validationRules: {IsRequiredRule()},
      ),
      defaultPriceInput: Input(
        value: product.defaultPrice.minorUnits > BigInt.zero
            ? product.defaultPrice.minorUnits.toString()
            : null,
        validationRules: {isMoneyRule},
      ),
      purchasePriceInput: Input(
        value: product.purchasePrice.minorUnits > BigInt.zero
            ? product.purchasePrice.minorUnits.toString()
            : null,
        validationRules: {isMoneyRule},
      ),
      stockInput: Input(
        value: product.stock > 0 ? product.stock.toString() : null,
        validationRules: {IsIntegerRule()},
      ),
    );
  }

  Future<void> updateName(String name) async {
    final value = await future;

    state = AsyncData(
      value.copyWith(
        status: EditProductStatus.LOADING,
        nameInput: value.nameInput.copyWith(value: name),
      ),
    );

    _debouncer.debounce(() => _searchProductUseCase.exec(name: name));
    await _debouncer.completer.future.then((it) {
      if (it != null) {
        state = AsyncData(
          value.copyWith(
            nameInput: value.nameInput.copyWith(
              errors: value.nameInput.errors
                ..add(ValidationError.PRODUCT_NAME_TAKEN),
            ),
          ),
        );
      }
    });

    state = AsyncData(value.copyWith(status: EditProductStatus.INITIAL));
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

    state = AsyncData(value.copyWith(status: EditProductStatus.LOADING));

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

    state = AsyncData(state.value!.copyWith(status: EditProductStatus.SUCCESS));
  }
}

final editProductProvider = AsyncNotifierProvider.autoDispose(
  EditProductAsyncNotifier.new,
);
