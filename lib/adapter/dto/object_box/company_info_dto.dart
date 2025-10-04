import 'package:objectbox/objectbox.dart';

@Entity()
class CompanyInfoDto {
  @Id(assignable: true)
  int id;

  final String? logoFileName;
  final String? name;
  final String? document;
  final String? email;
  final String? phone;

  @Property(type: PropertyType.date)
  DateTime updatedAt;

  CompanyInfoDto({
    required this.id,
    required this.updatedAt,
    this.logoFileName,
    this.name,
    this.document,
    this.email,
    this.phone,
  });
}
