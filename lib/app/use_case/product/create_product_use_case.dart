import 'package:logger/logger.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/main.dart';

class CreateProductUseCase {
  final _logger = Logger(printer: UseCasePrinter());
  final _service = getIt.get<ProductService>();

  CreateProductUseCase();

  Future<Id> exec({
    required String name,
    Money? defaultPrice,
    int? stock,
  }) async {
    _logger.d('Creating product');

    return await _service.create(
      name: name.trim(),
      // TODO: Fix this.
      defaultPrice: defaultPrice ?? Money.fromInt(0, isoCode: 'COP'),
      stock: stock ?? 0,
    );
  }
}
