import 'package:logger/logger.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/comon/typedefs.dart';

class UpdateProductUseCase {
  final ProductService _service;

  UpdateProductUseCase(this._service);

  Future<void> exec({
    required Id id,
    required String name,
    Money? defaultPrice,
    int? stock,
  }) async {
    Logger().d("[USE-CASE] Updating product");
    await _service.update(
      id: id,
      name: name.toUpperCase(),
      defaultPrice: defaultPrice ?? Money.fromInt(0, isoCode: 'COP'),
      stock: stock ?? 0,
    );
  }
}
