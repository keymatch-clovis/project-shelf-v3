import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/dto/update_product_request.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';
import 'package:project_shelf_v3/injectable.dart';

class UpdateProductUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<ProductService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  Future<Product> exec(UpdateProductRequest request) async {
    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    _logger.d('Updating product with: $request');
    return await _service.update(
      Product.fromMoney(
        defaultCurrency,
        id: request.id,
        name: request.name,
        defaultPrice: request.defaultPrice,
        purchasePrice: request.purchasePrice,
        stock: request.stock,
      ),
      defaultCurrency: defaultCurrency,
    );
  }
}
