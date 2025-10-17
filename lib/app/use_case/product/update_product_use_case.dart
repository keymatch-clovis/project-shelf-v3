import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/dto/update_product_request.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';
import 'package:project_shelf_v3/injectable.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
final class UpdateProductUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<ProductService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  Future<Result<Product, Error>> exec(UpdateProductRequest request) async {
    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    final defaultPrice = request.defaultPrice.unwrapOr(defaultCurrency.zero);
    final purchasePrice = request.purchasePrice.unwrapOr(defaultCurrency.zero);
    final stock = request.stock.unwrapOr(0);

    final product = Product(
      id: request.id,
      name: request.name,
      defaultPrice: defaultPrice,
      purchasePrice: purchasePrice,
      stock: stock,
    );

    _logger.d('Updating product with: $product');
    return await _service.update(product).then((it) {
      return Result.ok(it);
    });
  }
}
