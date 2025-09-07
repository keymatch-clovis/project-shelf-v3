import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/adapter/ui_state/state_event.dart';

part 'product_details_state.freezed.dart';

@freezed
abstract class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState({
    @Default(false) bool isLoading,
    required ProductDto product,
  }) = _ProductDetailsState;

  const ProductDetailsState._();

  /// Computed properties.
  bool get isValid {
    return !isLoading;
  }
}

/// Event related
class ProductDeleted implements StateEvent {}
