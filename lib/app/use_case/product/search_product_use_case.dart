import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';

class SearchProductUseCase {
  final Logger _logger = Logger(printer: UseCasePrinter());

  final ProductService _service;

  SearchProductUseCase(this._service);

  Future<Product?> exec({String? name}) async {
    if (name != null) {
      _logger.d('Searching product with name: $name');
      return await _service.searchWithName(name);
    }

    throw AssertionError("[USE-CASE] Tried to search product with null values");
  }
}
