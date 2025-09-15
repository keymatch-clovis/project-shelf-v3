import 'package:project_shelf_v3/app/entity/city.dart';

class Customer {
  final int id;
  final String name;
  final String? businessName;
  final City city;
  final String? address;
  final String? phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? pendingDeleteUntil;

  Customer({
    required this.id,
    required this.name,
    this.businessName,
    required this.city,
    this.address,
    this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
    this.pendingDeleteUntil,
  });
}
