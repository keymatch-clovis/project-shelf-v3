import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/framework/shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_provider.freezed.dart';

@freezed
abstract class SharedPreferencesState with _$SharedPreferencesState {
  const factory SharedPreferencesState({required bool mustLoadDefaultData}) =
      _SharedPreferencesState;
}

class SharedPreferences extends AsyncNotifier<SharedPreferencesState> {
  @override
  FutureOr<SharedPreferencesState> build() async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

    final mustLoadDefaultData =
        await asyncPrefs.getBool(Preference.MUST_LOAD_DEFAULT_DATA.name) ??
        true;

    return SharedPreferencesState(mustLoadDefaultData: mustLoadDefaultData);
  }

  Future<void> setMustLoadDefaultData(bool value) async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.setBool(Preference.MUST_LOAD_DEFAULT_DATA.name, value);
  }
}

/// Provider related
final sharedPreferencesProvider =
    AsyncNotifierProvider<SharedPreferences, SharedPreferencesState>(() {
      return SharedPreferences();
    });
