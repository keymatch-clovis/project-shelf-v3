import 'dart:io';
import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_shelf_v3/domain/service/file_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';

final class FileServiceImpl implements FileService {
  final _logger = Logger(printer: ImplPrinter());

  // https://docs.flutter.dev/cookbook/persistence/reading-writing-files#1-find-the-correct-local-path
  Future<String> get _localPath async {
    return await getApplicationDocumentsDirectory().then((it) => it.path);
  }

  @override
  Future<void> saveToFile({
    required Uint8List bytes,
    required String name,
  }) async {
    final path = await _localPath;

    _logger.d("Writing bytes to file: $name");
    final file = File('$path/$name');
    await file.writeAsBytes(bytes);
  }

  @override
  Future<File?> searchFile(String name) async {
    final path = await _localPath;

    final file = File('$path/$name');

    _logger.d('Searching file with name: $name');
    final exists = await file.exists();
    return exists ? file : null;
  }

  @override
  Future<File> findFile(String name) async {
    final path = await _localPath;

    final file = File('$path/$name');

    _logger.d('Finding file with name: $name');
    assert(await file.exists());
    return file;
  }
}
