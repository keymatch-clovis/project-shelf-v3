import 'package:project_shelf_v3/adapter/dto/ui/city_dto.dart';
import 'package:project_shelf_v3/app/dto/customer_with_city_response.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';

final class CustomerDto {
  final Id id;
  final String name;
  final String? businessName;
  final String? address;
  final String? phoneNumber;
  final Id cityId;

  const CustomerDto({
    required this.id,
    required this.name,
    required this.cityId,

    this.businessName,
    this.address,
    this.phoneNumber,
  });

  factory CustomerDto.fromEntity(Customer customer) {
    return CustomerDto(
      id: customer.id!,
      name: customer.name,
      businessName: customer.businessName,
      address: customer.address,
      phoneNumber: customer.phoneNumber,
      cityId: customer.cityId,
    );
  }
}

final class CustomerWithCityDto {
  final CustomerDto customer;
  final CityDto city;

  const CustomerWithCityDto({required this.customer, required this.city});

  factory CustomerWithCityDto.fromResponse(CustomerWithCityResponse response) {
    return CustomerWithCityDto(
      customer: CustomerDto.fromEntity(response.customer),
      city: CityDto.fromEntity(response.city),
    );
  }
}
