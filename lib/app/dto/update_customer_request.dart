import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class UpdateCustomerRequest {
  final Id id;
  final String name;
  final Id cityId;

  final Option<String> businessName;
  final Option<String> address;
  final Option<String> phoneNumber;

  UpdateCustomerRequest({
    required this.id,
    required this.name,
    required this.cityId,

    required this.businessName,
    required this.address,
    required this.phoneNumber,
  });
}
