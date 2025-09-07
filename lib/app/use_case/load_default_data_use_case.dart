import 'package:csv/csv.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/app/entity/app_preferences.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';

class LoadDefaultDataUseCase {
  final Logger _logger = Logger(printer: UseCasePrinter());

  /// Services related
  final CityService _cityService;
  final AppPreferencesService _appPreferencesService;

  LoadDefaultDataUseCase({
    required CityService cityService,
    required AppPreferencesService appPreferencesService,
  }) : _cityService = cityService,
       _appPreferencesService = appPreferencesService;

  Future<void> exec({required String citiesCsv}) async {
    _logger.d("Loading default data");
    final appPreferences = await _appPreferencesService.getAppPreferences();

    if (appPreferences.mustLoadDefaultData != false) {
      await _loadDefaultCities(citiesCsv);

      await _appPreferencesService.setAppPreferences(
        AppPreferences(mustLoadDefaultData: false),
      );
    }
  }

  Future<void> _loadDefaultCities(String citiesCsv) async {
    _logger.d("Loading default cities");

    final list = const CsvToListConverter().convert(citiesCsv);

    await _cityService.deleteAll();

    await _cityService.create(
      list.map((el) {
        return (department: el[0], name: el[1]);
      }),
    );
  }
}
