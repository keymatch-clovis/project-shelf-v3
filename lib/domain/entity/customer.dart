import 'package:project_shelf_v3/common/typedefs.dart';

class Customer {
  final String name;
  final Id cityId;

  final int? id;
  final String? businessName;
  final String? address;
  final String? phoneNumber;

  Customer({
    required String name,
    required this.cityId,

    this.id,
    String? businessName,
    String? address,
    String? phoneNumber,
  }) : name = name.trim(),
       businessName = businessName?.trim(),
       address = address?.trim(),
       phoneNumber = phoneNumber?.trim();
}
