import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/framework/riverpod/use_case_provider.dart';

final productListProvider = StreamProvider.autoDispose<List<ProductDto>>((ref) {
  return ref.watch(watchProductsUseCaseProvider).exec().map((products) {
    return products.map((product) => product.toDto()).toList();
  });
});
