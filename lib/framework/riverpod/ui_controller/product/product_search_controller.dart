import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/framework/riverpod/use_case_provider.dart';

// https://riverpod.dev/docs/concepts/modifiers/family#prefer-using-autodispose-when-the-parameter-is-not-constant
final productSearchProvider = StreamProvider.autoDispose
    .family<List<ProductDto>, String>((ref, query) {
      return ref.watch(searchProductsUseCaseProvider).exec(query).map((
        products,
      ) {
        return products.map((product) => product.toDto()).toList();
      });
    });
