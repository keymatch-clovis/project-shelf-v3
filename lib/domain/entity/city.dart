import 'package:project_shelf_v3/common/typedefs.dart';

class City {
  final String name;
  final String department;

  final Id? id;

  City({required String name, required String department, this.id})
    : name = name.trim().toUpperCase(),
      department = department.trim().toUpperCase();
}
