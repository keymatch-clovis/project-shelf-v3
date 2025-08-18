import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/framework/riverpod/use_case_provider.dart';

final productListProvider = StreamProvider.autoDispose<List<Product>>((ref) {
  Logger().d("[VIEW-MODEL] Watching products");
  return ref.watch(watchProductsUseCaseProvider).exec();
});
