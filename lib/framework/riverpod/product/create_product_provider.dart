import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_integer_rule.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_money_rule.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_not_empty_rule.dart';
import 'package:project_shelf_v3/adapter/common/validator/rule/is_required_rule.dart';
import 'package:project_shelf_v3/adapter/common/validator/validation_error.dart';
import 'package:project_shelf_v3/app/dto/create_product_request.dart';
import 'package:project_shelf_v3/app/use_case/product/create_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/search_product_use_case.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/common/debouncer.dart';
import 'package:project_shelf_v3/framework/riverpod/app_preferences_provider.dart';
import 'package:project_shelf_v3/main.dart';

part 'create_product_provider.freezed.dart';

/// State related
enum CreateProductStatus { initial, loading, success }

@freezed
abstract class CreateProductState with _$CreateProductState {
  const factory CreateProductState({
    @Default(CreateProductStatus.initial) CreateProductStatus status,
    required Currency currency,
    required Input nameInput,
    required Input defaultPriceInput,
    required Input purchasePriceInput,
    required Input<String> stockInput,
    @Default([]) List<File> photoFiles,
  }) = _CreateProductState;

  const CreateProductState._();

  // Computed properties
  bool get isValid => <bool>[
    nameInput.errors.isEmpty,
    defaultPriceInput.errors.isEmpty,
    stockInput.errors.isEmpty,
    status == CreateProductStatus.initial,
  ].every((el) => el);
}

/// Provider related
class CreateProductAsyncNotifier extends AsyncNotifier<CreateProductState> {
  final _searchProductUseCase = getIt.get<SearchProductUseCase>();
  final _createProductUseCase = getIt.get<CreateProductUseCase>();
  final _debouncer = Debouncer();

  @override
  FutureOr<CreateProductState> build() async {
    final appPreferences = await ref.watch(appPreferencesProvider.future);
    final currency = appPreferences.defaultCurrency;

    final isMoneyRule = IsMoneyRule(appPreferences.defaultCurrency);

    return CreateProductState(
      currency: currency,
      nameInput: Input(validationRules: {IsRequiredRule(), IsNotEmptyRule()}),
      defaultPriceInput: Input(validationRules: {isMoneyRule}),
      purchasePriceInput: Input(validationRules: {isMoneyRule}),
      stockInput: Input(validationRules: {IsIntegerRule()}),
    );
  }

  Future<void> updateName(String name) async {
    final value = await future;

    final newState = value.copyWith(
      nameInput: value.nameInput.copyWith(value: name),
    );

    state = AsyncData(newState.copyWith(status: CreateProductStatus.loading));

    _debouncer.debounce(() => _searchProductUseCase.exec(name: name));
    await _debouncer.completer.future.then((it) {
      if (it != null) {
        state = AsyncData(
          newState.copyWith(
            nameInput: newState.nameInput.copyWith(
              errors: newState.nameInput.errors
                ..add(ValidationError.PRODUCT_NAME_TAKEN),
            ),
          ),
        );
      }
    });

    state = AsyncData(newState.copyWith(status: CreateProductStatus.initial));
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

  Future<void> create() async {
    final value = await future;
    assert(value.isValid);

    state = AsyncData(value.copyWith(status: CreateProductStatus.loading));

    await _createProductUseCase.exec(
      CreateProductRequest(
        name: value.nameInput.value.trim(),
        defaultPrice: value.currency.tryParse(value.defaultPriceInput.value),
        purchasePrice: value.currency.tryParse(value.purchasePriceInput.value),
        stock: int.tryParse(value.stockInput.value ?? ""),
      ),
    );

    state = AsyncData(
      state.value!.copyWith(status: CreateProductStatus.success),
    );
  }

  Future<void> openCamera() async {
    final imagePicker = ImagePicker();
    final picked = await imagePicker.pickImage(source: ImageSource.camera);

    if (picked != null) {
      state = AsyncData(
        state.value!.copyWith(
          photoFiles: [...state.value!.photoFiles, File(picked.path)],
        ),
      );
    }
  }
}

final createProductProvider = AsyncNotifierProvider.autoDispose(
  CreateProductAsyncNotifier.new,
);
