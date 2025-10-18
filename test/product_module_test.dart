import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/common/constants.dart';
import 'package:project_shelf_v3/app/dto/create_product_request.dart';
import 'package:project_shelf_v3/app/dto/update_product_request.dart';
import 'package:project_shelf_v3/app/use_case/product/create_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/update_product_use_case.dart';
import 'package:project_shelf_v3/app/use_case/product/watch_products_use_case.dart';
import 'package:project_shelf_v3/common/exception/product_name_taken_exception.dart';
import 'package:project_shelf_v3/injectable.dart';

void main() {
  final faker = Faker();

  setUpAll(() async {
    await configureDependencies(injectable.Environment.test);
  });

  test('Creates product', () async {
    final request = CreateProductRequest(
      name: faker.randomGenerator.string(10),
      defaultPrice: Money.fromInt(10, isoCode: DEFAULT_CURRENCY.name),
      purchasePrice: Money.fromInt(10, isoCode: DEFAULT_CURRENCY.name),
      stock: 10,
    );

    final product = await getIt
        .get<CreateProductUseCase>()
        .exec(request)
        .unwrap();

    expect(product.name, request.name.toUpperCase());
    expect(product.defaultPrice.minorUnits.toInt(), 10);
    expect(product.purchasePrice.minorUnits.toInt(), 10);
    expect(product.stock, 10);
  });

  test('Creates product, fails with product name taken', () async {
    final request = CreateProductRequest(
      name: faker.randomGenerator.string(10),
    );

    await getIt.get<CreateProductUseCase>().exec(request).unwrap();

    final result = await getIt.get<CreateProductUseCase>().exec(request);

    expect(result.isErr(), true);
    expect(result.unwrapErr(), isA<ProductNameTakenException>());
  });

  test('Reads products', () async {
    final products = await getIt.get<WatchProductsUseCase>().exec().first;

    expect(products.isNotEmpty, true);
  });

  test('Updates product', () async {
    final request = CreateProductRequest(
      name: faker.randomGenerator.string(10),
      defaultPrice: Money.fromInt(10, isoCode: DEFAULT_CURRENCY.name),
      purchasePrice: Money.fromInt(10, isoCode: DEFAULT_CURRENCY.name),
      stock: 10,
    );

    final product = await getIt
        .get<CreateProductUseCase>()
        .exec(request)
        .unwrap();

    expect(product.name, request.name.toUpperCase());
    expect(product.defaultPrice.minorUnits.toInt(), 10);
    expect(product.purchasePrice.minorUnits.toInt(), 10);
    expect(product.stock, 10);

    final updateRequest = UpdateProductRequest(
      id: product.id.unwrap(),
      name: faker.randomGenerator.string(20),
      defaultPrice: Money.fromInt(20, isoCode: DEFAULT_CURRENCY.name),
      purchasePrice: Money.fromInt(20, isoCode: DEFAULT_CURRENCY.name),
      stock: 20,
    );

    final updatedProduct = await getIt
        .get<UpdateProductUseCase>()
        .exec(updateRequest)
        .unwrap();

    expect(updatedProduct.name, updateRequest.name.toUpperCase());
    expect(updatedProduct.defaultPrice.minorUnits.toInt(), 20);
    expect(updatedProduct.purchasePrice.minorUnits.toInt(), 20);
    expect(updatedProduct.stock, 20);
  });

  test('Updates product, fails with product name taken', () async {
    final product1 = await getIt
        .get<CreateProductUseCase>()
        .exec(CreateProductRequest(name: faker.randomGenerator.string(10)))
        .unwrap();

    final product2 = await getIt
        .get<CreateProductUseCase>()
        .exec(CreateProductRequest(name: faker.randomGenerator.string(10)))
        .unwrap();

    final result = await getIt.get<UpdateProductUseCase>().exec(
      UpdateProductRequest(id: product2.id.unwrap(), name: product1.name),
    );

    expect(result.isErr(), true);
    expect(result.unwrapErr(), isA<ProductNameTakenException>());
  });
}
