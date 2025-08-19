import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/comon/logger/use_case_printer.dart';

class WatchProductsUseCase {
  final Logger _logger = Logger(printer: UseCasePrinter());

  final ProductService _service;

  WatchProductsUseCase(this._service);

  Stream<List<Product>> exec() {
    _logger.d('Watching products');
    return _service.watch();
  }
}
