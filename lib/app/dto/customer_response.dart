import 'package:project_shelf_v3/app/dto/city_response.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class CustomerResponse {
  final Id id;
  final String name;
  final CityResponse city;

  final String? businessName;
  final String? address;
  final String? phoneNumber;

  const CustomerResponse({
    required this.id,
    required this.name,
    required this.city,
    this.businessName,
    this.address,
    this.phoneNumber,
  });


}
