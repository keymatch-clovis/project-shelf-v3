import 'dart:io';
import 'dart:typed_data';

abstract interface class FileService {
  Future<void> saveToFile({required Uint8List bytes, String? name});
  Future<File> findFile(String name);
  Future<File?> searchFile(String name);
}
