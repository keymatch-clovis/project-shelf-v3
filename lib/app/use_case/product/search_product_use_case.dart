import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';
import 'package:project_shelf_v3/injectable.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
final class SearchProductUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<ProductService>();

  Future<Option<Product>> exec({String? name}) async {
    if (name != null) {
      if (name.isEmpty) {
        return None();
      }

      _logger.d('Searching product with name: $name');
      return await _service.searchWithName(
        // TODO: Maybe we can convert the product name to an entity? It would
        //  be good.
        name.trim(),
      );
    }

    throw AssertionError("Tried to search product with null values");
  }
}
