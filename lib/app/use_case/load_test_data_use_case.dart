import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/app/use_case/use_case.dart';
import 'package:project_shelf_v3/domain/aggregate/product_aggregate.dart';
import 'package:project_shelf_v3/injectable.dart';
import 'package:faker/faker.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
final class LoadTestDataUseCase extends UseCase<Unit, Result> {
  final _productService = getIt.get<ProductService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  @override
  Future<Result> exec(Unit input) async {
    final faker = Faker();
    final random = Random();

    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    logger.d('Loading test data');
    logger.d('Deleting all products');
    await _productService.deleteAll();
    logger.d('Products deleted');

    logger.d('Creating test products');
    for (final _ in Iterable.generate(30)) {
      await _productService.create(
        ProductAggregate(
          defaultCurrency,
          name: '${faker.food.dish()} ${faker.food.cuisine()}',
          defaultPrice: Some(
            Money.fromIntWithCurrency(random.nextInt(1000000), defaultCurrency),
          ),
          purchasePrice: Some(
            Money.fromIntWithCurrency(random.nextInt(1000000), defaultCurrency),
          ),
          stock: Some(random.nextInt(1000)),
        ),
      );
    }
    logger.d('Products created');

    return Result.ok(unit);
  }
}
