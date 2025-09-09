import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shelf_v3/app/entity/product.dart';

/// Event related
sealed class SelectedProductEvent {
  const SelectedProductEvent();
}

final class ProductSelected extends SelectedProductEvent {
  final Product product;
  const ProductSelected(this.product);
}

/// State related
sealed class SelectedProductState {
  const SelectedProductState();
}

final class Empty extends SelectedProductState {}

final class Selected extends SelectedProductState {
  final Product product;
  const Selected(this.product);
}

/// Bloc related
class SelectedProductBloc
    extends Bloc<SelectedProductEvent, SelectedProductState> {
  SelectedProductBloc() : super(Empty()) {
    on<ProductSelected>(_onProductSelected);
  }

  void _onProductSelected(
    ProductSelected event,
    Emitter<SelectedProductState> emit,
  ) {
    emit(Selected(event.product));
  }
}
