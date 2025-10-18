import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class CreateCustomerRequest {
  final String name;
  final Id cityId;
  final Option<String> businessName;
  final Option<String> address;
  final Option<String> phoneNumber;

  CreateCustomerRequest({
    required this.name,
    required this.cityId,
    String? businessName,
    String? address,
    String? phoneNumber,
  }) : businessName = Option.from(businessName),
       address = Option.from(address),
       phoneNumber = Option.from(phoneNumber);
}
