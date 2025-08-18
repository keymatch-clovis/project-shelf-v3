import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';

class SearchProductUseCase {
  final ProductService _service;

  const SearchProductUseCase(this._service);

  Future<Product?> exec({String? name}) async {
    if (name != null) {
      Logger().d("[USE-CASE] Searching product with name: $name");
      return await _service.searchWithName(name);
    }

    throw AssertionError("[USE-CASE] Tried to search product with null values");
  }
}
