import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/app/use_case/app_preferences/get_app_preferences_use_case.dart';
import 'package:project_shelf_v3/main.dart';

/// Event related
sealed class AppPreferencesEvent {}

final class PreferencesFetched extends AppPreferencesEvent {}

/// State related
sealed class AppPreferencesState {
  const AppPreferencesState();
}

final class InitialState extends AppPreferencesState {}

final class SuccessState extends AppPreferencesState {
  final bool mustLoadDefaultData;
  final Currency defaultCurrency;

  const SuccessState({
    required this.mustLoadDefaultData,
    required this.defaultCurrency,
  });
}

/// Bloc related
class AppPreferencesBloc
    extends Bloc<AppPreferencesEvent, AppPreferencesState> {
  final _getAppPreferencesUseCase = getIt.get<GetAppPreferencesUseCase>();

  AppPreferencesBloc() : super(InitialState()) {
    on<PreferencesFetched>(_onPreferencesFetched);
  }

  Future<void> _onPreferencesFetched(
    PreferencesFetched event,
    Emitter<AppPreferencesState> emit,
  ) async {
    final preferences = await _getAppPreferencesUseCase.exec();

    emit(
      SuccessState(
        mustLoadDefaultData: preferences.mustLoadDefaultData,
        defaultCurrency: preferences.defaultCurrency,
      ),
    );
  }
}
