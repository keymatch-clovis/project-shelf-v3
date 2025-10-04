import 'dart:typed_data';

final class CompanyInfoDto {
  final Uint8List? logoBytes;
  final String? name;
  final String? document;
  final String? email;
  final String? phone;

  const CompanyInfoDto({
    this.logoBytes,
    this.name,
    this.document,
    this.email,
    this.phone,
  });
}
