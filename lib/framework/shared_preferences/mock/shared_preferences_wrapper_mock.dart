import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:project_shelf_v3/adapter/repository/app_preferences_repository.dart';
import 'package:project_shelf_v3/domain/entity/app_preferences.dart';

@test
@Singleton(as: AppPreferencesRepository)
class SharedPreferencesWrapperMock implements AppPreferencesRepository {
  final memory = <AppPreferenceKey, dynamic>{};

  @override
  Future<bool?> getBool(AppPreferenceKey key) async {
    return memory[key];
  }

  @override
  Future<String?> getString(AppPreferenceKey key) async {
    return memory[key];
  }

  @override
  Future<void> setBool(AppPreferenceKey key, bool value) async {
    memory[key] = value;
  }

  @override
  Future<void> setString(AppPreferenceKey key, String value) async {
    memory[key] = value;
  }
}
