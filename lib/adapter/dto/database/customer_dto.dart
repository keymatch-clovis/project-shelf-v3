import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/common/date_time_epoch_converter.dart';
import 'package:project_shelf_v3/app/dto/city_response.dart';
import 'package:project_shelf_v3/app/dto/customer_response.dart';

part "customer_dto.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
@DateTimeEpochConverter()
class CustomerDto {
  final int id;
  final String name;
  final String? businessName;
  final int city;
  final String? address;
  final String? phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? pendingDeleteUntil;

  CustomerDto({
    required this.id,
    required this.name,
    this.businessName,
    required this.city,
    this.address,
    this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
    this.pendingDeleteUntil,
  });

  factory CustomerDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerDtoFromJson(json);

  CustomerResponse toResponse({required CityResponse city}) {
    return CustomerResponse(
      id: id,
      name: name,
      city: city,
      businessName: businessName,
      address: address,
      phoneNumber: phoneNumber,
    );
  }
}
