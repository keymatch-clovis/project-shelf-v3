import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

class City {
  final String name;
  final String department;

  final Option<Id> id;

  City({required String name, required String department, Id? id})
    : id = Option.from(id),
      name = name.trim().toUpperCase(),
      department = department.trim().toUpperCase();
}
