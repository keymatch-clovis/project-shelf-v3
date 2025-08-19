import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/comon/logger/use_case_printer.dart';
import 'package:project_shelf_v3/comon/typedefs.dart';

class FindProductUseCase {
  final Logger _logger = Logger(printer: UseCasePrinter());

  final ProductService _service;

  FindProductUseCase(this._service);

  Future<Product> exec({String? name, Id? id}) async {
    await Future.delayed(const Duration(seconds: 2));

    if (id != null) {
      _logger.d('Finding product with ID: $id');
      return await _service.findById(id);
    }

    if (name != null) {
      _logger.d('Finding product with name: $name');
      return await _service.findByName(name.toUpperCase());
    }

    throw AssertionError("Tried to find products with null values");
  }
}
