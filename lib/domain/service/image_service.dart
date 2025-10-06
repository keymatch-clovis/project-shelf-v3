import 'dart:typed_data';

abstract interface class ImageService {
  Future<Uint8List> squareCrop(Uint8List bytes, {required int size});
  Future<Uint8List> grayscale(Uint8List bytes, {required int amount});
}
