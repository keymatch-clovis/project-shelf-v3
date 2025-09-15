import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/app/use_case/load_default_data_use_case.dart';
import 'package:project_shelf_v3/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "splash_screen_provider.freezed.dart";

/// State related
enum SplashScreenLoadingStatus { INITIAL, LOADING, LOADING_DEFAULT_DATA, DONE }

@freezed
abstract class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState({
    @Default(SplashScreenLoadingStatus.INITIAL)
    SplashScreenLoadingStatus loadingStatus,
  }) = _SplashScreenState;
}

final class SplashScreenAsyncNotifier extends AsyncNotifier<SplashScreenState> {
  final _loadDefaultDataUseCase = getIt.get<LoadDefaultDataUseCase>();

  @override
  FutureOr<SplashScreenState> build() {
    return SplashScreenState();
  }

  Future<void> loadDefaultData() async {
    await future;
    state = AsyncData(
      SplashScreenState(
        loadingStatus: SplashScreenLoadingStatus.LOADING_DEFAULT_DATA,
      ),
    );

    await _loadDefaultDataUseCase.exec();
    state = AsyncData(
      SplashScreenState(loadingStatus: SplashScreenLoadingStatus.DONE),
    );
  }
}

final splashScreenProvider = AsyncNotifierProvider(
  SplashScreenAsyncNotifier.new,
);
