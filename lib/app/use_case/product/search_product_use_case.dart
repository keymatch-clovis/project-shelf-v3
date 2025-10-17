import 'dart:async';

import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';
import 'package:project_shelf_v3/injectable.dart';

class SearchProductUseCase {
  final Logger _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<ProductService>();

  SearchProductUseCase();

  Future<Product?> exec({String? name}) async {
    if (name != null) {
      if (name.isEmpty) {
        return null;
      }

      _logger.d('Searching product with name: $name');
      return await _service.searchWithName(name.trim());
    }

    throw AssertionError("Tried to search product with null values");
  }
}
