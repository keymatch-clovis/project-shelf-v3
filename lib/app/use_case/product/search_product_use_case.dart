import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';
import 'package:project_shelf_v3/injectable.dart';

@Singleton(order: RegisterOrder.USE_CASE)
final class SearchProductUseCase {
  final Logger _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<ProductService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  SearchProductUseCase();

  Future<Product?> exec({String? name}) async {
    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    if (name != null) {
      if (name.isEmpty) {
        return null;
      }

      _logger.d('Searching product with name: $name');
      return await _service.searchWithName(
        // TODO: Maybe we can convert the product name to an entity? It would
        //  be good.
        name.trim(),
        defaultCurrency: defaultCurrency,
      );
    }

    throw AssertionError("Tried to search product with null values");
  }
}
