import 'dart:typed_data';

import 'package:project_shelf_v3/domain/service/image_service.dart';

final class InvoiceLogo {
  final Uint8List bytes;

  const InvoiceLogo._({required this.bytes});

  static Future<InvoiceLogo> create({
    required ImageService imageService,
    required Uint8List bytes,
  }) async {
    var logoBytes = bytes;

    // I found this size through trial and error for a paper size of 58mm. If
    // we want to support other paper sizes, this would have to change.
    //
    // For now, both of these can stay the same, as we don't expect this to
    // change anytime soon.
    logoBytes = await imageService.squareCrop(logoBytes, size: 200);
    logoBytes = await imageService.grayscale(logoBytes, amount: 20);

    return InvoiceLogo._(bytes: logoBytes);
  }
}
