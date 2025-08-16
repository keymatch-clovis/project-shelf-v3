import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
sealed class ProductDto with _$ProductDto {
  factory ProductDto({
    required int id,
    required String name,
    required int defaultPrice,
    required int stock,
    required int createdAt,
    required int updatedAt,
    required int pendingDeleteUntil,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);
}
