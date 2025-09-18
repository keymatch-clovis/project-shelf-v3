import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/common/date_time_epoch_converter.dart';
import 'package:project_shelf_v3/adapter/dto/database/city_dto.dart';
import 'package:project_shelf_v3/app/dto/customer_with_city_response.dart';
import 'package:project_shelf_v3/domain/entity/customer.dart';

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

  Customer toEntity() {
    return Customer(name: name, cityId: city, id: id);
  }
}

class CustomerWithCityDto {
  final CustomerDto customer;
  final CityDto city;

  CustomerWithCityDto({required this.customer, required this.city});

  CustomerWithCityResponse toResponse() {
    return CustomerWithCityResponse(
      customer: customer.toEntity(),
      city: city.toEntity(),
    );
  }
}
