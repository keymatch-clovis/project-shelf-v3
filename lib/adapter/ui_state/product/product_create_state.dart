import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/input.dart';

part 'product_create_state.freezed.dart';

@freezed
abstract class ProductCreateState with _$ProductCreateState {
  const factory ProductCreateState({
    @Default(false) bool isLoading,
    required Input name,
    required Input defaultPrice,
    required Input stock,
  }) = _ProductCreateState;

  const ProductCreateState._();

  /// Computed properties
  bool get isValid {
    return name.errors.isEmpty &&
        defaultPrice.errors.isEmpty &&
        stock.errors.isEmpty &&
        !isLoading;
  }
}
