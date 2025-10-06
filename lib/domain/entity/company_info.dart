import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/company_logo.dart';

// We will only manage one object containing this data. So the ID will be
// always the same.
const COMPANY_INFO_ID = 1;

final class CompanyInfo {
  final Id id = COMPANY_INFO_ID;

  final CompanyLogo? logo;
  final String? name;
  final String? document;
  final String? email;
  final String? phone;

  const CompanyInfo({
    required this.logo,
    required this.name,
    required this.document,
    required this.email,
    required this.phone,
  });
}
