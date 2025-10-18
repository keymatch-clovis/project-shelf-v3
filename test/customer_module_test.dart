import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:project_shelf_v3/app/dto/create_customer_request.dart';
import 'package:project_shelf_v3/app/use_case/city/search_cities_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/create_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/load_default_data_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

void main() {
  final faker = Faker();

  setUpAll(() async {
    await configureDependencies(injectable.Environment.test);
  });

  test('Creates customer', () async {
    // NOTE: This is something I don't really know. We're using here a use case
    // from a totally diferent and unrelated module. If this use case fails, it
    // means the city module is failing, and not the customer module.
    // But, without the customer module working, this one can't work, so it is
    // ok?
    //
    // NOTE: I have done a little research, and these are considered almost like
    // E2E testing, so it seems fine.
    await getIt.get<LoadDefaultDataUseCase>().exec();

    // Take the first city, we don't really care about which one for the test.
    final city = await getIt
        .get<SearchCitiesUseCase>()
        .exec()
        .map((it) => it.first)
        .first;

    final request = CreateCustomerRequest(
      name: faker.randomGenerator.string(10),
      businessName: faker.randomGenerator.string(10),
      address: faker.randomGenerator.string(10),
      phoneNumber: faker.randomGenerator.string(10),
      cityId: city.id.unwrap(),
    );

    final result = await getIt.get<CreateCustomerUseCase>().exec(request);
  });
}
