import 'dart:async';
import 'dart:io';

import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/use_case/use_case.dart';
import 'package:project_shelf_v3/domain/service/database_service.dart';
import 'package:project_shelf_v3/main.dart';

final class BackupDatabaseUseCase extends UseCase<Unit, Result<File, Object>> {
  final _service = getIt.get<DatabaseService>();

  @override
  Future<Result<File, Object>> exec(Unit input) async {
    logger.d('Creating database backup');
    return _service.backup();
  }
}
