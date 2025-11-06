import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/dto/create_customer_request.dart';
import 'package:project_shelf_v3/app/dto/update_customer_request.dart';
import 'package:project_shelf_v3/app/use_case/city/search_cities_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/create_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/delete_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/find_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/update_customer_use_case.dart';
import 'package:project_shelf_v3/app/use_case/customer/get_customers_use_case.dart';
import 'package:project_shelf_v3/app/use_case/load_default_data_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

void main() {
  final faker = Faker();

  setUpAll(() async {
    await configureDependencies(injectable.Environment.test);

    // NOTE: This is something I don't really know. We're using here a use case
    // from a totally diferent and unrelated module. If this use case fails, it
    // means the city module is failing, and not the customer module.
    // But, without the customer module working, this one can't work, so it is
    // ok?
    //
    // NOTE: I have done a little research, and these are considered almost like
    // E2E testing, so it seems fine.
    await getIt.get<LoadDefaultDataUseCase>().exec();
  });

  test('Creates customer', () async {
    // Take the first city, we don't really care about which one for the test.
    final city = await getIt
        .get<SearchCitiesUseCase>()
        .exec()
        .map((it) => it.first)
        .first;

    final request = CreateCustomerRequest(
      name: faker.randomGenerator.string(10),
      businessName: Some(faker.randomGenerator.string(10)),
      address: Some(faker.randomGenerator.string(10)),
      phoneNumber: Some(faker.randomGenerator.string(10)),
      cityId: city.id.unwrap(),
    );

    final customer = await getIt
        .get<CreateCustomerUseCase>()
        .exec(request)
        .then((it) => it.unwrap());

    expect(customer.name, request.name.toUpperCase());
    expect(
      customer.businessName.unwrap(),
      request.businessName.unwrap().toUpperCase(),
    );
    expect(customer.address.unwrap(), request.address.unwrap().toUpperCase());
    expect(customer.phoneNumber.unwrap(), request.phoneNumber.unwrap());
    expect(customer.cityId, request.cityId);
  });

  test('Reads products', () async {
    final customers = await getIt.get<GetCustomersUseCase>().exec().first;

    expect(customers.isNotEmpty, true);
  });

  test('Updates customer', () async {
    // Take the first city, we don't really care about which one for the test.
    var city = await getIt
        .get<SearchCitiesUseCase>()
        .exec()
        .map((it) => it.first)
        .first;

    final request = CreateCustomerRequest(
      name: faker.randomGenerator.string(10),
      businessName: Some(faker.randomGenerator.string(10)),
      address: Some(faker.randomGenerator.string(10)),
      phoneNumber: Some(faker.randomGenerator.string(10)),
      cityId: city.id.unwrap(),
    );

    final customer = await getIt
        .get<CreateCustomerUseCase>()
        .exec(request)
        .then((it) => it.unwrap());

    // Take another city to test the update.
    city = await getIt
        .get<SearchCitiesUseCase>()
        .exec()
        .map((it) => it.last)
        .first;

    final updateRequest = UpdateCustomerRequest(
      id: customer.id.unwrap(),
      name: faker.randomGenerator.string(10),
      cityId: city.id.unwrap(),
      businessName: Some(faker.randomGenerator.string(10)),
      address: Some(faker.randomGenerator.string(10)),
      phoneNumber: Some(faker.randomGenerator.string(10)),
    );

    final updatedCustomer = await getIt
        .get<UpdateCustomerUseCase>()
        .exec(updateRequest)
        .unwrap();

    expect(updatedCustomer.id.unwrap(), updateRequest.id);
    expect(updatedCustomer.name, updateRequest.name.toUpperCase());
    expect(updatedCustomer.cityId, updateRequest.cityId);
    expect(
      updatedCustomer.businessName.unwrap(),
      updateRequest.businessName.unwrap().toUpperCase(),
    );
    expect(
      updatedCustomer.address.unwrap(),
      updateRequest.address.unwrap().toUpperCase(),
    );
    expect(
      updatedCustomer.phoneNumber.unwrap(),
      updateRequest.phoneNumber.unwrap(),
    );
  });

  test('Deletes customer', () async {
    // Take the first city, we don't really care about which one for the test.
    var city = await getIt
        .get<SearchCitiesUseCase>()
        .exec()
        .map((it) => it.first)
        .first;

    final customer = await getIt
        .get<CreateCustomerUseCase>()
        .exec(
          CreateCustomerRequest(
            name: faker.randomGenerator.string(10),
            cityId: city.id.unwrap(),
            businessName: None(),
            address: None(),
            phoneNumber: None(),
          ),
        )
        .unwrap();

    await getIt.get<DeleteCustomerUseCase>().exec(customer.id.unwrap());

    final result = await getIt.get<FindCustomerUseCase>().exec(
      customer.id.unwrap(),
    );

    expect(result.isErr(), true);
  });
}
