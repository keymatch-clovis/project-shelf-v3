import 'package:flutter/foundation.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/app/common/constants.dart';
import 'package:project_shelf_v3/app/service/asset_service.dart';
import 'package:project_shelf_v3/app/service/file_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/main.dart';

final class GetLogoUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _fileService = getIt.get<FileService>();
  final _assetService = getIt.get<AssetService>();

  Future<Uint8List> exec() async {
    final file = await _fileService.searchFile(DEFAULT_LOGO_FILE_NAME);
    if (file != null) {
      _logger.d('Getting logo');
      return file.readAsBytes();
    }

    _logger.d("Getting default logo");
    return _assetService.getDefaultLogo();
  }
}
