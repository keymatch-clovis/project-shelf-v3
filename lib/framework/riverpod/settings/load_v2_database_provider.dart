import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:project_shelf_v3/app/use_case/settings/load_v2_database_use_case.dart';
import 'package:project_shelf_v3/main.dart';

part 'load_v2_database_provider.freezed.dart';

// State related
enum LoadV2DatabaseStatus { INITIAL, LOADING, DONE }

@freezed
abstract class LoadV2DatabaseState with _$LoadV2DatabaseState {
  const factory LoadV2DatabaseState({
    @Default(LoadV2DatabaseStatus.INITIAL) LoadV2DatabaseStatus status,
  }) = _LoadV2DatabaseState;
}

final class LoadV2DatabaseNotifier extends Notifier<LoadV2DatabaseState> {
  final _loadV2DatabaseUseCase = getIt.get<LoadV2DatabaseUseCase>();

  @override
  LoadV2DatabaseState build() {
    return LoadV2DatabaseState();
  }

  Future<void> load() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['sqlite'],
    );

    if (result != null) {
      state = state.copyWith(status: LoadV2DatabaseStatus.LOADING);

      await _loadV2DatabaseUseCase.exec(result.files.single.path!);

      state = state.copyWith(status: LoadV2DatabaseStatus.DONE);
    }
  }
}

final loadV2DatabaseProvider = NotifierProvider.autoDispose(
  LoadV2DatabaseNotifier.new,
);
