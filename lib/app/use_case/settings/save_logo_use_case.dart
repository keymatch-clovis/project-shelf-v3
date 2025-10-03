import 'dart:typed_data';

import 'package:image/image.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/app/common/constants.dart';
import 'package:project_shelf_v3/app/service/file_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/main.dart';

final class SaveLogoUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _fileService = getIt.get<FileService>();

  Future<void> exec({required Uint8List logoBytes}) async {
    _logger.d('Saving logo');

    // https://github.com/brendan-duncan/image/blob/main/doc/commands.md
    final cmd = Command()
      ..decodeImage(logoBytes)
      ..copyResizeCropSquare(size: 200)
      ..encodeJpg();

    final bytes = await cmd.getBytesThread();

    await _fileService.saveToFile(bytes: bytes!, name: DEFAULT_LOGO_FILE_NAME);
  }
}
