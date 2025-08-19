import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_event.dart';
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
    // We could create an use case just to check if the app must load the
    // default data, and prevent a reference watch. For now, we can just call
    // the use case and let it handle that case with the business rules.
    final citiesCsv = await rootBundle.loadString(
      'assets/raw/departments_cities.csv',
    );

    ref.watch(loadDefaultDataUseCaseProvider).exec(citiesCsv: citiesCsv);
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
