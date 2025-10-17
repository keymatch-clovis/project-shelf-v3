import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/app/use_case/app_preferences/get_app_preferences_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

/// State related
class AppPreferencesState {
  final Currency defaultCurrency;

  const AppPreferencesState({required this.defaultCurrency});
}

/// Provider related
class AppPreferencesAsyncNotifier extends AsyncNotifier<AppPreferencesState> {
  final _useCase = getIt.get<GetAppPreferencesUseCase>();

  @override
  FutureOr<AppPreferencesState> build() {
    return _useCase.exec().then((result) {
      return AppPreferencesState(defaultCurrency: result.defaultCurrency);
    });
  }
}

final appPreferencesProvider = AsyncNotifierProvider(
  AppPreferencesAsyncNotifier.new,
);
