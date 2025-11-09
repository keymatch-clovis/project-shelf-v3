import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oxidized/oxidized.dart';
import 'package:path/path.dart';
import 'package:project_shelf_v3/app/use_case/settings/backup_database_use_case.dart';
import 'package:project_shelf_v3/main.dart';

final class SettingsNotifier extends Notifier<Unit> {
  final _backupDatabaseUseCase = getIt.get<BackupDatabaseUseCase>();

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
}

final settingsProvider = NotifierProvider.autoDispose(SettingsNotifier.new);
