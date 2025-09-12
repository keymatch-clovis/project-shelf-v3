import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/app/entity/product.dart';

/// State related
sealed class SelectedProductState {
  const SelectedProductState();
}

final class None extends SelectedProductState {}

final class Selected extends SelectedProductState {
  final Product dto;

  const Selected(this.dto);
}

/// Provider related
final class SelectedProductNotifier extends Notifier<SelectedProductState> {
  @override
  SelectedProductState build() {
    return None();
  }

  void select(Product dto) {
    state = Selected(dto);
  }

  Future<void> delete() async {}
}

final selectedProductProvider = NotifierProvider(SelectedProductNotifier.new);
