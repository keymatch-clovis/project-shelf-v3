import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/dto/create_product_request.dart';
import 'package:project_shelf_v3/app/use_case/product/create_product_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

void main() {
  setUp(() {
    configureDependencies(injectable.Environment.test);
  });

  test('Creates product', () async {
    final faker = Faker();

    final request = CreateProductRequest(
      name: faker.randomGenerator.string(10),
    );

    final product = await CreateProductUseCase().exec(request).unwrap();

    expect(product.name, request.name.toUpperCase());
    expect(product.defaultPrice.isZero, true);
    expect(product.purchasePrice.isZero, true);
    expect(product.stock, 0);
  });
}
