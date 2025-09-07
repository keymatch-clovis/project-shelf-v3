import 'package:logger/logger.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

class UpdateProductUseCase {
  final Logger _logger = Logger(printer: UseCasePrinter());

  final ProductService _service;

  UpdateProductUseCase(this._service);

  Future<Product> exec({
    required Id id,
    required String name,
    Money? defaultPrice,
    int? stock,
  }) async {
    _logger.d('Updating product');
    return await _service.update(
      id: id,
      name: name.toUpperCase(),
      // FIXME: Fix this.
      defaultPrice: defaultPrice ?? Money.fromInt(0, isoCode: 'COP'),
      stock: stock ?? 0,
    );
  }
}
