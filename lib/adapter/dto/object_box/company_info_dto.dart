import 'package:objectbox/objectbox.dart';

@Entity()
class CompanyInfoDto {
  @Id(assignable: true)
  int id;

  String? logoUri;
  String? name;
  String? document;
  String? email;
  String? phone;

  @Property(type: PropertyType.date)
  DateTime updatedAt;

  CompanyInfoDto({
    required this.id,
    required this.updatedAt,
    this.logoUri,
    this.name,
    this.document,
    this.email,
    this.phone,
  });
}

