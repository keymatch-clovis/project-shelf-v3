import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/ui_state/main/main_state.dart';
import 'package:project_shelf_v3/framework/riverpod/use_case_provider.dart';

final mainControllerProvider = NotifierProvider<MainController, MainState>(
  MainController.new,
);

class MainController extends Notifier<MainState> {
  @override
  MainState build() {
    final state = MainState(isLoading: true);

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
