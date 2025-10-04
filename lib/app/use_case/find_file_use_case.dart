import 'dart:io';

import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/service/file_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/main.dart';

final class FindFileUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<FileService>();

  Future<File> exec(String name) {
    _logger.d('Finding file with name: $name');
    return _service.findFile(name);
  }
}
