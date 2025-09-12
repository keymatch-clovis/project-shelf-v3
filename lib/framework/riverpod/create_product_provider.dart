import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/custom_state_error.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/extension/currency_extension.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/input.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/validator/currency_validator.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/validator/int_validator.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/validator/string_validator.dart';
import 'package:project_shelf_v3/app/use_case/product/create_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/search_product_use_case.dart';
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
    required Input nameInput,
    required Input defaultPriceInput,
    required Input stockInput,
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

    return CreateProductState(
      nameInput: Input(StringValidator(isRequired: true)),
      defaultPriceInput: Input(
        CurrencyValidator(appPreferences.defaultCurrency),
      ),
      stockInput: Input(IntValidator()),
    );
  }

  Future<void> updateName(String value) async {
    await future;

    state = AsyncData(
      state.value!.copyWith(
        status: CreateProductStatus.loading,
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

    state = AsyncData(
      state.value!.copyWith(status: CreateProductStatus.initial),
    );
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

  Future<void> updateStock(String value) async {
    await future;

    state = AsyncData(
      state.value!.copyWith(
        stockInput: state.value!.stockInput.copyWith(value: value),
      ),
    );
  }

  Future<void> create() async {
    await future;
    assert(state.value!.isValid);

    final appPreferences = await ref.watch(appPreferencesProvider.future);

    state = AsyncData(
      state.value!.copyWith(status: CreateProductStatus.loading),
    );

    await _createProductUseCase.exec(
      name: state.value!.nameInput.value.trim(),
      defaultPrice: appPreferences.defaultCurrency.tryParse(
        state.value!.defaultPriceInput.value,
      ),
      stock: int.tryParse(state.value!.stockInput.value),
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
