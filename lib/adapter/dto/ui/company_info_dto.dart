import 'dart:typed_data';

import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/domain/entity/company_info.dart';

final class CompanyInfoDto {
  final Option<Uint8List> logoBytes;
  final Option<String> name;
  final Option<String> document;
  final Option<String> email;
  final Option<String> phone;

  const CompanyInfoDto({
    required this.logoBytes,
    required this.name,
    required this.document,
    required this.email,
    required this.phone,
  });

  factory CompanyInfoDto.fromEntity(CompanyInfo entity) {
    return CompanyInfoDto(
      logoBytes: entity.logo.map((it) => it.bytes),
      name: entity.name,
      document: entity.document,
      email: entity.email,
      phone: entity.phone,
    );
  }
}
