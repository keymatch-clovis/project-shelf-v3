import 'dart:typed_data';

final class CompanyInfoRequest {
  final Uint8List? logoBytes;
  final String? name;
  final String? document;
  final String? email;
  final String? phone;

  const CompanyInfoRequest({
    required this.logoBytes,
    required this.name,
    required this.document,
    required this.email,
    required this.phone,
  });
}
