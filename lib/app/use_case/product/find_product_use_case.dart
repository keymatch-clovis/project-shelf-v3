import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';
import 'package:project_shelf_v3/injectable.dart';

class FindProductUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<ProductService>();

  FindProductUseCase();

  Future<Product> exec({String? name, Id? id}) async {
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
