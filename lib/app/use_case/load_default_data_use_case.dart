import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/asset_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/city_service.dart';
import 'package:project_shelf_v3/main.dart';

class LoadDefaultDataUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  /// Services related
  final _cityService = getIt.get<CityService>();
  final _assetService = getIt.get<AssetService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  Future<void> exec() async {
    _logger.d("Loading default data");

    final appPreferences = await _appPreferencesService.getAppPreferences();

    if (appPreferences.mustLoadDefaultData) {
      await _loadDefaultCities();

      await _appPreferencesService.setAppPreferences(
        appPreferences.copyWith(mustLoadDefaultData: false),
      );
    }
  }

  Future<void> _loadDefaultCities() async {
    _logger.d("Loading default cities");

    final citiesData = await _assetService.getCities();

    // Delete the previous data, as we want to have a clean state.
    await _cityService.deleteAll();

    await _cityService.createMany(
      citiesData.map(
        (it) => CreateArgs(name: it.name, department: it.department),
      ),
    );
  }
}
