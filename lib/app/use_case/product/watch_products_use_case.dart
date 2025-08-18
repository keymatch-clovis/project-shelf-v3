import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';

class WatchProductsUseCase {
  final ProductService _service;

  WatchProductsUseCase(this._service);

  Stream<List<Product>> exec() {
    Logger().d("[USE-CASE] Watching products");
    return _service.watch();
  }
}