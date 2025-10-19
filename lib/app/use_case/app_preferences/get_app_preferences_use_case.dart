import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/app_preferences.dart';
import 'package:project_shelf_v3/injectable.dart';

@LazySingleton(order: RegisterOrder.USE_CASE)
class GetAppPreferencesUseCase {
  final _logger = Logger(printer: UseCasePrinter());
  final _service = getIt.get<AppPreferencesService>();

  Future<AppPreferences> exec() async {
    _logger.d("Getting app preferences");
    return await _service.getAppPreferences();
  }
}
