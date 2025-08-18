import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/framework/riverpod/use_case_provider.dart';

// https://riverpod.dev/docs/concepts/modifiers/family#prefer-using-autodispose-when-the-parameter-is-not-constant
final productSearchProvider = StreamProvider.autoDispose
    .family<List<Product>, String>((ref, query) {
      Logger().d("[VIEW-MODEL] Searching products with: $query");
      return ref.watch(searchProductsUseCaseProvider).exec(query);
    });
