import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/use_case/product/delete_product_use_case.dart';
import 'package:project_shelf_v3/main.dart';

/// State related
enum SelectedProductStatus { INITIAL, LOADING, DELETED }

sealed class SelectedProductState {
  final SelectedProductStatus status;

  SelectedProductState({SelectedProductStatus? status})
    : status = status ?? SelectedProductStatus.INITIAL;
}

final class None extends SelectedProductState {}

final class Selected extends SelectedProductState {
  final Product product;

  Selected({required this.product, super.status});

  Selected copyWith({Product? product, SelectedProductStatus? status}) {
    return Selected(
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
    return None();
  }

  void select(Product product) {
    state = Selected(product: product);
  }

  Future<void> delete() async {
    assert(state is Selected);

    state = (state as Selected).copyWith(status: SelectedProductStatus.LOADING);

    await _deleteProductUseCase.exec((state as Selected).product.id);

    state = (state as Selected).copyWith(status: SelectedProductStatus.DELETED);
  }
}

final selectedProductProvider = NotifierProvider(SelectedProductNotifier.new);
