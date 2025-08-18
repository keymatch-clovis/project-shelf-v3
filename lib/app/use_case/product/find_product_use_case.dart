import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/comon/typedefs.dart';

class FindProductUseCase {
  final ProductService _service;

  FindProductUseCase(this._service);

  Future<Product> exec({String? name, Id? id}) {
    if (id != null) {
      Logger().d("[USE-CASE] Finding product with id: $id");
      return _service.findById(id);
    }

    if (name != null) {
      Logger().d("[USE-CASE] Finding product with name: $name");
      return _service.findByName(name.toUpperCase());
    }

    throw AssertionError("[USE-CASE] Tried to find products with null values");
  }
}
