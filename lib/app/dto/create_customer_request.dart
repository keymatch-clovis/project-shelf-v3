import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class CreateCustomerRequest {
  final String name;
  final Option<String> businessName;
  final Option<String> address;
  final Option<String> phoneNumber;

  final Id cityId;

  CreateCustomerRequest({
    required this.name,
    required this.cityId,
    required this.businessName,
    required this.address,
    required this.phoneNumber,
  });
}
