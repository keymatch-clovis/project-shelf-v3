import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';

/// State related
sealed class ProductDetailsState {
  final ProductDto dto;

  const ProductDetailsState(this.dto);
}

final class StateLoading extends ProductDetailsState {
  const StateLoading(super.dto);
}

final class StateSuccess extends ProductDetailsState {
  const StateSuccess(super.dto);
}

/// Event related
sealed class ProductDetailsEvent {
  const ProductDetailsEvent();
}

/// Bloc related
class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc(ProductDto dto) : super(StateLoading(dto));
}
