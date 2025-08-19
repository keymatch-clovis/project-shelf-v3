import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/comon/logger/use_case_printer.dart';
import 'package:project_shelf_v3/comon/typedefs.dart';

class DeleteProductUseCase {
  final Logger _logger = Logger(printer: UseCasePrinter());
  final ProductService _service;

  DeleteProductUseCase(this._service);

  Future<void> exec(Id id) async {
    _logger.d('Deleting product with ID: $id');
    await _service.delete(id);
  }
}