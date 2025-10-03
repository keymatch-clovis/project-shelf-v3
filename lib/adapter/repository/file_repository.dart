import 'dart:io';
import 'dart:typed_data';

abstract interface class FileRepository {
  Future<void> saveToFile({required Uint8List bytes, String? name});
  Future<File?> searchFile(String name);
}
