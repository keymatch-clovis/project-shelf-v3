import 'dart:io';
import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_shelf_v3/adapter/repository/file_repository.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:uuid/uuid.dart';

final class FileRepositoryImpl implements FileRepository {
  final _logger = Logger(printer: FrameworkPrinter());

  // https://docs.flutter.dev/cookbook/persistence/reading-writing-files#1-find-the-correct-local-path
  Future<String> get _localPath async {
    return await getApplicationDocumentsDirectory().then((it) => it.path);
  }

  @override
  Future<void> saveToFile({required Uint8List bytes, String? name}) async {
    final path = await _localPath;

    // Generates a time-based version 1 UUID
    final fileName = name ?? Uuid().v1();

    _logger.d("Writing bytes to file: $fileName");
    final file = File('$path/$fileName');
    await file.writeAsBytes(bytes);
  }

  @override
  Future<File?> searchFile(String name) async {
    final path = await _localPath;

    final file = File('$path/$name');

    _logger.d('Searching file with name: $name');
    final exists = await file.exists();
    if (exists) {
      return file;
    }
    return null;
  }
}
