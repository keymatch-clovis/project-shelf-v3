import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/dto/create_product_request.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';
import 'package:project_shelf_v3/injectable.dart';

@Singleton(order: RegisterOrder.USE_CASE)
final class CreateProductUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<ProductService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  CreateProductUseCase();

  Future<Id> exec(CreateProductRequest request) async {
    final appPreferences = await _appPreferencesService.getAppPreferences();

    _logger.d('Creating product');
    return await _service.create(
      Product.fromMoney(
        appPreferences.defaultCurrency,
        name: request.name,
        defaultPrice: request.defaultPrice,
        purchasePrice: request.purchasePrice,
        stock: request.stock,
      ),
    );
  }
}
