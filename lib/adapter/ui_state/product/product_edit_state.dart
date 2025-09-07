import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/extension/currency_extension.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/input.dart';

part 'product_edit_state.freezed.dart';

@freezed
abstract class ProductEditState with _$ProductEditState {
  const factory ProductEditState({
    @Default(false) bool isLoading,
    required Currency currency,
    required ProductDto product,
    required Input name,
    required Input defaultPrice,
    required Input stock,
  }) = _ProductEditState;

  const ProductEditState._();

  ProductDto get computedProduct => ProductDto(
    id: product.id,
    name: name.value,
    defaultPrice: currency.tryParse(defaultPrice.value),
    stock: int.tryParse(stock.value),
  );

  /// Computed properties
  bool get isValid {
    return name.errors.isEmpty &&
        defaultPrice.errors.isEmpty &&
        stock.errors.isEmpty &&
        // Check the current input is different from the initial product.
        (product.name != computedProduct.name ||
            product.defaultPrice != computedProduct.defaultPrice ||
            product.stock != computedProduct.stock) &&
        !isLoading;
  }
}
