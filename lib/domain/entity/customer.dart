import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class Customer {
  static const MAX_NAME_LENGTH = 255;
  static const MAX_BUSINESS_NAME_LENGTH = 255;
  static const MAX_ADDRESS_LENGTH = 255;

  // https://stackoverflow.com/questions/723587/whats-the-longest-possible-worldwide-phone-number-i-should-consider-in-sql-varc#4729239
  static const MAX_PHONE_NUMBER_LENGTH = 50;

  final String name;
  final Id cityId;

  Option<Id> id;
  final Option<String> businessName;
  final Option<String> address;
  final Option<String> phoneNumber;

  Customer({
    required String name,
    required this.cityId,

    Id? id,
    String? businessName,
    String? address,
    String? phoneNumber,
  }) : id = Option.from(id),
       name = name.trim().toUpperCase(),
       businessName = Option.from(businessName?.trim().toUpperCase()),
       address = Option.from(address?.trim().toUpperCase()),
       phoneNumber = Option.from(phoneNumber?.trim()) {
    assert(name.length <= MAX_NAME_LENGTH);
    this.businessName.map((it) {
      assert(it.length <= MAX_BUSINESS_NAME_LENGTH);
    });
    this.address.map((it) {
      assert(it.length <= MAX_ADDRESS_LENGTH);
    });
    this.phoneNumber.map((it) {
      assert(it.length <= MAX_PHONE_NUMBER_LENGTH);
    });
  }

  factory Customer.fromOptional({
    required String name,
    required Id cityId,

    Option<Id>? id,
    Option<String>? businessName,
    Option<String>? address,
    Option<String>? phoneNumber,
  }) => Customer(
    name: name,
    cityId: cityId,
    id: id?.toNullable(),
    businessName: businessName?.toNullable(),
    address: address?.toNullable(),
    phoneNumber: phoneNumber?.toNullable(),
  );
}
