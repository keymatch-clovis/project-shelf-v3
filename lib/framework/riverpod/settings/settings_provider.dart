import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oxidized/oxidized.dart';
import 'package:path/path.dart';
import 'package:project_shelf_v3/app/use_case/load_test_data_use_case.dart';
import 'package:project_shelf_v3/app/use_case/settings/backup_database_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

final class SettingsNotifier extends Notifier<Unit> {
  final _backupDatabaseUseCase = getIt.get<BackupDatabaseUseCase>();
  final _loadTestDataUseCase = getIt.get<LoadTestDataUseCase>();

  @override
  Unit build() => unit;

  Future<Result> backupDatabase() async {
    await _backupDatabaseUseCase.exec(unit).mapAsync((it) async {
      final fileName = basename(it.path);
      final bytes = await it.readAsBytes();

      await FilePicker.platform.saveFile(fileName: fileName, bytes: bytes);
    });

    return Ok(unit);
  }

  Future<Result> loadTestData() {
    return _loadTestDataUseCase.exec(unit);
  }
}

final settingsProvider = NotifierProvider.autoDispose(SettingsNotifier.new);
