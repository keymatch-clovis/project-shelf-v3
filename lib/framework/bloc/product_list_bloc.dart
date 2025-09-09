import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/app/use_case/product/watch_products_use_case.dart';
import 'package:project_shelf_v3/main.dart';

/// Event related
sealed class ProductListEvent {}

final class ProductsFetched extends ProductListEvent {}

/// State related
enum ProductListStatus { initial, success }

final class ProductListState {
  final ProductListStatus status;
  final List<ProductDto> items;

  const ProductListState({
    this.status = ProductListStatus.initial,
    this.items = const [],
  });
}

/// Bloc related
class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final _useCase = getIt.get<WatchProductsUseCase>();

  ProductListBloc() : super(const ProductListState()) {
    on<ProductsFetched>(_onProductsFetched);
  }

  Future<void> _onProductsFetched(
    ProductsFetched event,
    Emitter<ProductListState> emit,
  ) async {
    await emit.forEach(
      _useCase.exec(),
      onData: (result) {
        return ProductListState(
          status: ProductListStatus.success,
          items: result.map((el) => el.toDto()).toList(),
        );
      },
    );
  }
}
