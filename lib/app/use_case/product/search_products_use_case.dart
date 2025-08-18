import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';

class SearchProductsUseCase {
  final ProductService _service;

  SearchProductsUseCase(this._service);

  Stream<List<Product>> exec(String value) {
    Logger().d("[USE-CASE] Searching products with: $value");
    if (value.isEmpty) {
      return Stream.value([]);
    }

    return _service.search(value);
  }
}