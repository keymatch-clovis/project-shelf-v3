import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class Customer {
  static const MAX_NAME_LENGTH = 255;
  static const MAX_BUSINESS_NAME_LENGTH = 255;
  static const MAX_ADDRESS_LENGTH = 255;

  // https://stackoverflow.com/questions/723587/whats-the-longest-possible-worldwide-phone-number-i-should-consider-in-sql-varc#4729239
  static const MAX_PHONE_NUMBER_LENGTH = 50;

  String name;
  Id cityId;

  Option<Id> id;
  Option<String> businessName;
  Option<String> address;
  Option<String> phoneNumber;

  Customer({
    required this.name,
    required this.cityId,
    required this.id,
    required this.businessName,
    required this.address,
    required this.phoneNumber,
  }) {
    name = name.trim().toUpperCase();
    assert(name.length <= MAX_NAME_LENGTH);

    businessName = businessName.map((it) => it.trim().toUpperCase());
    businessName.map((it) {
      assert(it.length <= MAX_BUSINESS_NAME_LENGTH);
    });

    address = address.map((it) => it.trim().toUpperCase());
    address.map((it) {
      assert(it.length <= MAX_ADDRESS_LENGTH);
    });

    phoneNumber = phoneNumber.map((it) => it.trim());
    phoneNumber.map((it) {
      assert(it.length <= MAX_PHONE_NUMBER_LENGTH);
    });
  }
}
