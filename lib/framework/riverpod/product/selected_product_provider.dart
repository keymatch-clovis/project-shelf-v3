import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/app/use_case/product/delete_product_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

/// State related
enum SelectedProductStatus { INITIAL, LOADING, DELETED }

sealed class SelectedProductState {
  final SelectedProductStatus status;

  SelectedProductState({SelectedProductStatus? status})
    : status = status ?? SelectedProductStatus.INITIAL;
}

final class NoneState extends SelectedProductState {}

final class SelectedState extends SelectedProductState {
  final ProductDto product;

  SelectedState({required this.product, super.status});

  SelectedState copyWith({ProductDto? product, SelectedProductStatus? status}) {
    return SelectedState(
      product: product ?? this.product,
      status: status ?? this.status,
    );
  }
}

/// Provider related
final class SelectedProductNotifier extends Notifier<SelectedProductState> {
  final _deleteProductUseCase = getIt.get<DeleteProductUseCase>();

  @override
  SelectedProductState build() {
    return NoneState();
  }

  void select(ProductDto product) {
    state = SelectedState(product: product);
  }

  Future<void> delete() async {
    assert(state is SelectedState);

    state = (state as SelectedState).copyWith(status: SelectedProductStatus.LOADING);

    await _deleteProductUseCase.exec((state as SelectedState).product.id);

    state = (state as SelectedState).copyWith(status: SelectedProductStatus.DELETED);
  }
}

final selectedProductProvider = NotifierProvider(SelectedProductNotifier.new);
