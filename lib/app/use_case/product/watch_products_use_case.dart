import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/main.dart';

class WatchProductsUseCase {
  final Logger _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<ProductService>();

  WatchProductsUseCase();

  Stream<List<Product>> exec() {
    _logger.d('Watching products');
    return _service.watch();
  }
}
