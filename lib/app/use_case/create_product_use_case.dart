import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/comon/typedefs.dart';

class CreateProductUseCase {
  final ProductService _service;

  CreateProductUseCase(this._service);

  Future<Id> exec({required String name, int? defaultPrice, int? stock}) async {
    Logger().d("[USE-CASE] Creating product");
    return await _service.create(
      name: name,
      defaultPrice: defaultPrice ?? 0,
      stock: stock ?? 0,
    );
  }
}
