import 'dart:typed_data';

import 'package:image/image.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/domain/service/image_service.dart';

final class ImageServiceImpl implements ImageService {
  final _logger = Logger(printer: ImplPrinter());

  @override
  Future<Uint8List> grayscale(Uint8List bytes, {required int amount}) {
    final cmd = Command()
      ..decodeImage(bytes)
      ..grayscale(amount: amount)
      ..encodeJpg();

    _logger.d('Grayscaling image to $amount');
    return cmd.getBytesThread().then((it) => it!);
  }

  @override
  Future<Uint8List> squareCrop(Uint8List bytes, {required int size}) {
    final cmd = Command()
      ..decodeImage(bytes)
      ..copyResizeCropSquare(size: size)
      ..encodeJpg();

    _logger.d('Cropping image to square $size');
    return cmd.getBytesThread().then((it) => it!);
  }
}
