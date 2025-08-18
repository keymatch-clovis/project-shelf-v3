import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_event.dart';
import 'package:project_shelf_v3/framework/riverpod/shared_preferences_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/use_case_provider.dart';

part 'main_screen_view_model.freezed.dart';

@freezed
abstract class MainScreenViewModelState with _$MainScreenViewModelState {
  const factory MainScreenViewModelState({@Default(false) bool isLoading}) =
      _MainScreenViewModelState;
}

class MainScreenViewModel extends Notifier<MainScreenViewModelState> {
  @override
  MainScreenViewModelState build() {
    final state = MainScreenViewModelState(isLoading: true);

    _checkMustLoadDefaultData();

    return state;
  }

  Future<void> _checkMustLoadDefaultData() async {
    final preferences = await ref.read(sharedPreferencesProvider.future);
    if (preferences.mustLoadDefaultData) {
      final csv = await rootBundle.loadString(
        'assets/raw/departments_cities.csv',
      );
      ref.watch(loadDefaultCitiesUseCaseProvider).exec(csv);
    }
  }
}

/// Provider related
final mainScreenViewModelProvider =
    NotifierProvider<MainScreenViewModel, MainScreenViewModelState>(() {
      return MainScreenViewModel();
    });

/// Events related
final mainScreenViewModelEventProvider = StateProvider<ViewModelEvent?>(
  (_) => null,
  // NOTE: We don't dispose this one.
);

// NOTE: I don't think we have an event for this rn.
