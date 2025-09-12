import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/entity/product.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/main.dart';

class SearchProductsUseCase {
  final Logger _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<ProductService>();

  SearchProductsUseCase();

  Stream<List<Product>> exec({String query = ""}) {
    if (query.isEmpty) return Stream.value([]);

    _logger.d('Searching products with: $query');
    return _service.search(query);
  }
}

