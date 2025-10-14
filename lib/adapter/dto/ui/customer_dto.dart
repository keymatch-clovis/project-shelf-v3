import 'package:project_shelf_v3/adapter/dto/ui/city_dto.dart';
import 'package:project_shelf_v3/app/dto/customer_response.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class CustomerDto {
  final Id id;
  final String name;
  final String? businessName;
  final String? address;
  final String? phoneNumber;
  final CityDto city;

  const CustomerDto({
    required this.id,
    required this.name,
    required this.city,

    this.businessName,
    this.address,
    this.phoneNumber,
  });

  factory CustomerDto.fromResponse(CustomerResponse customer) {
    return CustomerDto(
      id: customer.id,
      name: customer.name,
      businessName: customer.businessName,
      address: customer.address,
      phoneNumber: customer.phoneNumber,
      city: CityDto.fromResponse(customer.city),
    );
  }

  String getFullName() {
    StringBuffer buffer = StringBuffer();

    buffer.write(name);

    if (businessName != null) {
      buffer.write(', ');
      buffer.write(businessName);
    }

    return buffer.toString();
  }
}
