import 'package:project_shelf_v3/common/typedefs.dart';

final class CityResponse {
  final Id id;
  final String name;
  final String department;

  const CityResponse({
    required this.id,
    required this.name,
    required this.department,
  });
}
