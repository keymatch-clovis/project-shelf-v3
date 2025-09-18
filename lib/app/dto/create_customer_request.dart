import 'package:project_shelf_v3/common/typedefs.dart';

final class CreateCustomerRequest {
  final String name;
  final Id cityId;
  final String? address;
  final String? phoneNumber;

  const CreateCustomerRequest({
    required this.name,
    required this.cityId,
    this.address,
    this.phoneNumber,
  });
}
