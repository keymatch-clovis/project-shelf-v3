import 'package:logger/logger.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/adapter/repository/app_preferences_repository.dart';
import 'package:project_shelf_v3/app/entity/app_preferences.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';

class AppPreferencesServiceImpl implements AppPreferencesService {
  final Logger _logger = Logger(printer: ImplPrinter());
  final AppPreferencesRepository _repository;

  AppPreferencesServiceImpl(this._repository);

  @override
  Future<AppPreferences> getAppPreferences() async {
    _logger.d("Getting app preferences");
    final bool? mustLoadDefaultData = await _repository.getBool(
      AppPreferenceKey.MUST_LOAD_DEFAULT_DATA.name,
    );

    return AppPreferences(mustLoadDefaultData: mustLoadDefaultData);
  }

  @override
  Future<void> setAppPreferences(AppPreferences appPreferences) async {
    _logger.d("Setting app preferences: $appPreferences");

    // NOTE: I don't really know if this is correct, as we have the entity with
    // nullable values. This can help us decide what to do with the fact that
    // the app preference might be true, false or null. Meaning the preference
    // is not set. This way is simpler, and we just have to assert some values
    // first, but this can be a hassle in the future. Better to keep that in
    // mind.
    assert(appPreferences.mustLoadDefaultData != null);

    await _repository.setBool(
      AppPreferenceKey.MUST_LOAD_DEFAULT_DATA.name,
      appPreferences.mustLoadDefaultData!,
    );
  }
}
