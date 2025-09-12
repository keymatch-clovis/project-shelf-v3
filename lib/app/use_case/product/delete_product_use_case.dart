import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/main.dart';

class DeleteProductUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<ProductService>();

  DeleteProductUseCase();

  Future<void> exec(Id id) async {
    _logger.d('Deleting product with ID: $id');
    await _service.delete(id);
  }
}
