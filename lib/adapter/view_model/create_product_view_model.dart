import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/view_model/common/input.dart';
import 'package:project_shelf_v3/adapter/view_model/common/validator/double_validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/validator/int_validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/validator/string_validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_event.dart';

part 'create_product_view_model.freezed.dart';

@freezed
abstract class CreateProductViewModelState with _$CreateProductViewModelState {
  const factory CreateProductViewModelState({
    required Input name,
    required Input defaultPrice,
    required Input stock,
  }) = _CreateProductViewModelState;

  const CreateProductViewModelState._();

  /// Computed properties
  bool get isValid {
    return name.errors.isEmpty &&
        defaultPrice.errors.isEmpty &&
        stock.errors.isEmpty;
  }
}

class CreateProductViewModel extends Notifier<CreateProductViewModelState> {
  @override
  CreateProductViewModelState build() {
    return CreateProductViewModelState(
      name: Input.empty(),
      defaultPrice: Input.empty(),
      stock: Input.empty(),
    );
  }

  void updateName(String value) {
    state = state.copyWith(
      name: Input(value: value, errors: validateString(value, required: true)),
    );
  }

  void updateDefaultPrice(String value) {
    state = state.copyWith(
      defaultPrice: Input(value: value, errors: validateDouble(value)),
    );
  }

  void updateStock(String value) {
    state = state.copyWith(
      stock: Input(value: value, errors: validateInt(value)),
    );
  }

  void create() async {
    print("Creating product");
    ref.read(createProductViewModelEventProvider.notifier).state =
        ProductCreated();
  }
}

/// View Model provider
final createProductViewModelProvider =
    NotifierProvider<CreateProductViewModel, CreateProductViewModelState>(() {
      return CreateProductViewModel();
    });

/// Events
class ProductCreated implements ViewModelEvent {}

final createProductViewModelEventProvider = StateProvider<ViewModelEvent?>(
  (_) => null,
);
