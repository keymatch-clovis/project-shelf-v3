// We will only manage one object containing this data. So the ID will be
// always the same.
import 'package:flutter/services.dart';
import 'package:image/image.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

const COMPANY_INFO_ID = 1;

final class CompanyInfo {
  final Id id = COMPANY_INFO_ID;

  final Uint8List? logoBytes;
  final String? name;
  final String? document;
  final String? email;
  final String? phone;

  String? logoFileName;

  CompanyInfo._({
    this.logoBytes,
    this.name,
    this.document,
    this.email,
    this.phone,
  });

  static Future<CompanyInfo> create({
    Uint8List? logoBytes,
    String? name,
    String? document,
    String? email,
    String? phone,
  }) async {
    Uint8List? bytes;
    if (logoBytes != null) {
      // https://github.com/brendan-duncan/image/blob/main/doc/commands.md
      final cmd = Command()
        ..decodeImage(logoBytes)
        ..copyResizeCropSquare(size: 200)
        ..encodeJpg();

      bytes = await cmd.getBytesThread().then((it) => it!);
    }

    return CompanyInfo._(
      logoBytes: bytes,
      name: name,
      document: document,
      email: email,
      phone: phone,
    );
  }
}
