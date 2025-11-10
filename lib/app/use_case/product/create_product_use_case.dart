import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/dto/create_product_request.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/aggregate/product_aggregate.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';
import 'package:project_shelf_v3/injectable.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
final class CreateProductUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<ProductService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  Future<Result<Product, Exception>> exec(CreateProductRequest request) async {
    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    final aggregate = ProductAggregate(
      defaultCurrency,
      name: request.name,
      defaultPrice: request.defaultPrice,
      purchasePrice: request.purchasePrice,
      stock: request.stock,
    );

    _logger.d('Creating product');
    return _service.create(aggregate).map((id) {
      return Product(
        id: id,
        name: aggregate.name,
        defaultPrice: aggregate.defaultPrice,
        purchasePrice: aggregate.purchasePrice,
        stock: aggregate.stock,
      );
    });
  }
}
