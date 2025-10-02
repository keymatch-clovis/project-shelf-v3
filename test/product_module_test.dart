import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:project_shelf_v3/adapter/repository/app_preferences_repository.dart';
import 'package:project_shelf_v3/adapter/repository/asset_repository.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart';
import 'package:project_shelf_v3/adapter/service_impl/app_preferences_service_impl.dart';
import 'package:project_shelf_v3/adapter/service_impl/asset_service_impl.dart';
import 'package:project_shelf_v3/adapter/service_impl/product_service_impl.dart';
import 'package:project_shelf_v3/app/dto/create_product_request.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/asset_service.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/app/use_case/product/create_product_use_case.dart';
import 'package:project_shelf_v3/framework/drift/dao/product_dao.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';

import 'mock/root_bundle_mock.dart';
import 'mock/shared_preferences_mock.dart';

void main() {
  final GetIt sl = GetIt.instance;

  late ShelfDatabase database;
  late ProductService service;

  setUp(() {
    // https://drift.simonbinder.eu/testing/#writing-tests
    database = ShelfDatabase(
      DatabaseConnection(
        NativeDatabase.memory(),
        closeStreamsSynchronously: true,
      ),
    );

    sl.registerSingleton<ShelfDatabase>(database);

    sl.registerSingleton<AssetRepository>(RootBundleMock());
    sl.registerSingleton<AppPreferencesRepository>(SharedPreferencesMock());
    sl.registerSingleton<ProductRepository>(ProductDao());

    sl.registerSingleton<AssetService>(AssetServiceImpl());
    sl.registerSingleton<AppPreferencesService>(AppPreferencesServiceImpl());

    service = ProductServiceImpl();
    sl.registerSingleton<ProductService>(service);
  });

  tearDown(() async {
    await database.close();
  });

  test('Creates product', () async {
    final faker = Faker();

    final request = CreateProductRequest(
      name: faker.randomGenerator.string(10),
    );

    final id = await CreateProductUseCase().exec(request);
    final product = await service.findById(id);

    expect(product.name, request.name.toUpperCase());
    expect(product.defaultPrice.isZero, true);
    expect(product.purchasePrice.isZero, true);
    expect(product.stock, 0);
  });
}
