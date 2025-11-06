import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/ui/city_dto.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/domain/entity/city.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';

final class CustomerDto {
  final Id id;
  final String name;
  final Option<String> businessName;
  final Option<String> address;
  final Option<String> phoneNumber;
  final CityDto city;

  const CustomerDto({
    required this.id,
    required this.name,
    required this.businessName,
    required this.address,
    required this.phoneNumber,
    required this.city,
  });

  factory CustomerDto.fromEntity(Customer customer, {required City city}) {
    return CustomerDto(
      id: customer.id.unwrap(),
      name: customer.name,
      businessName: customer.businessName,
      address: customer.address,
      phoneNumber: customer.phoneNumber,
      city: CityDto.fromEntity(city),
    );
  }

  String getFullName() {
    StringBuffer buffer = StringBuffer();

    buffer.write(name);

    businessName.map((it) {
      buffer.write(', ');
      buffer.write(businessName);
    });

    return buffer.toString();
  }
}
