import 'package:project_shelf_v3/domain/entity/city.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';

final class CustomerWithCityResponse {
  final Customer customer;
  final City city;

  const CustomerWithCityResponse({required this.customer, required this.city});
}
