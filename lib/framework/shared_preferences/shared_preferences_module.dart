import 'package:injectable/injectable.dart';
import 'package:project_shelf_v3/adapter/repository/app_preferences_repository.dart';
import 'package:project_shelf_v3/framework/shared_preferences/shared_preferences_wrapper.dart';
import 'package:project_shelf_v3/injectable.dart';

@module
abstract class SharedPreferencesModule {
  @Singleton(
    env: [Environment.prod, CustomEnvironment.integrationTest],
    order: RegisterOrder.REPOSITORY,
  )
  AppPreferencesRepository get module => SharedPreferencesWrapper();
}
