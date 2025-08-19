import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_event.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/comon/typedefs.dart';
import 'package:project_shelf_v3/framework/riverpod/use_case_provider.dart';

part 'see_product_view_model.freezed.dart';

@freezed
abstract class SeeProductViewModelState with _$SeeProductViewModelState {
  const factory SeeProductViewModelState({@Default(false) bool isLoading}) =
      _SeeProductViewModelState;

  const SeeProductViewModelState._();

  /// Computed properties
  bool get isValid {
    return !isLoading;
  }
}

class SeeProductViewModel extends Notifier<SeeProductViewModelState> {
  @override
  SeeProductViewModelState build() {
    return SeeProductViewModelState();
  }

  Future<void> delete() async {}
}

/// Provider related
final seeProductProvider = FutureProvider.autoDispose.family<Product, Id>((
  ref,
  id,
) {
  return ref.watch(findProductUseCaseProvider).exec(id: id);
});

/// Events related
final seeProductViewModelEventProvider = StateProvider<ViewModelEvent?>(
  (_) => null,
  isAutoDispose: true,
);
