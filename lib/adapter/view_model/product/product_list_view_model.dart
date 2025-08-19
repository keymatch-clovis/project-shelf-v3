import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/framework/riverpod/use_case_provider.dart';

final productListProvider = StreamProvider.autoDispose<List<Product>>((ref) {
  return ref.watch(watchProductsUseCaseProvider).exec();
});
