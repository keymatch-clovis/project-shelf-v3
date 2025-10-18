import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' as injectable;
import 'package:project_shelf_v3/app/use_case/city/search_cities_use_case.dart';
import 'package:project_shelf_v3/app/use_case/load_default_data_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

abstract class CityModuleTest {
  // This is the amount of cities we have to record. We might add more later,
  // and we would need to change this.
  static const CITY_COUNT = 1123;
}

void main() {
  setUpAll(() async {
    await configureDependencies(injectable.Environment.test);
  });

  test('Loads default cities', () async {
    // Load all the default data, this contains the cities.
    await getIt.get<LoadDefaultDataUseCase>().exec();

    final cities = await getIt.get<SearchCitiesUseCase>().exec().first;

    expect(cities.length, CityModuleTest.CITY_COUNT);
  });
}
