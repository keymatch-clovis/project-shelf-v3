import 'dart:io';
import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/repository/file_repository.dart';
import 'package:project_shelf_v3/app/service/file_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/main.dart';

final class FileServiceImpl implements FileService {
  final _logger = Logger(printer: ImplPrinter());

  final _repository = getIt.get<FileRepository>();

  @override
  Future<void> saveToFile({required Uint8List bytes, String? name}) async {
    _logger.d("Saving file to: $name");
    await _repository.saveToFile(bytes: bytes, name: name);
  }

  @override
  Future<File?> searchFile(String name) {
    return _repository.searchFile(name);
  }
}
