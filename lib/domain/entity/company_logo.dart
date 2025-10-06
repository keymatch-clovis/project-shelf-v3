import 'dart:typed_data';

import 'package:project_shelf_v3/domain/service/image_service.dart';
import 'package:uuid/uuid.dart';

final class CompanyLogo {
  final Uint8List bytes;
  final String? fileName;

  const CompanyLogo({required this.bytes, this.fileName});

  static Future<CompanyLogo> fromRawImage({
    required ImageService imageService,
    required Uint8List bytes,
  }) async {
    var logoBytes = bytes;

    logoBytes = await imageService.squareCrop(logoBytes, size: 200);

    return CompanyLogo(
      bytes: logoBytes,
      // Generates a time-based version 1 UUID
      fileName: Uuid().v1(),
    );
  }
}
