import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_event.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/framework/riverpod/use_case_provider.dart';

part 'delete_product_view_model.freezed.dart';

@freezed
abstract class DeleteProductViewModelState with _$DeleteProductViewModelState {
  const factory DeleteProductViewModelState({
    @Default(false) bool isLoading,
    required Product product,
  }) = _DeleteProductViewModelState;

  const DeleteProductViewModelState._();

  /// Computed properties
  bool get isValid {
    return !isLoading;
  }
}

class DeleteProductViewModel
    extends FamilyNotifier<DeleteProductViewModelState, Product> {
  @override
  DeleteProductViewModelState build(Product product) {
    return DeleteProductViewModelState(product: product);
  }

  Future<void> delete() async {
    Logger().d("[VIEW-MODEL] Deleting product: ${state.product}");
    state = state.copyWith(isLoading: true);

    await ref.read(deleteProductUseCaseProvider).exec(state.product.id);
    ref.read(deleteProductViewModelEventProvider.notifier).state =
        ProductDeleted();

    state = state.copyWith(isLoading: false);
  }
}

/// Provider related
final deleteProductViewModelProvider = NotifierProvider.autoDispose
    .family<DeleteProductViewModel, DeleteProductViewModelState, Product>(() {
      return DeleteProductViewModel();
    });

/// Events related
final deleteProductViewModelEventProvider = StateProvider<ViewModelEvent?>(
  (_) => null,
  isAutoDispose: true,
);

class ProductDeleted implements ViewModelEvent {}
