import 'package:json_annotation/json_annotation.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/common/date_time_epoch_converter.dart';
import 'package:project_shelf_v3/app/provider/currency_provider.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';
import 'package:project_shelf_v3/injectable.dart';

part 'product_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
@DateTimeEpochConverter()
class ProductDto {
  final int id;
  final String name;
  final int defaultPrice;
  final int purchasePrice;
  final int stock;

  final String currencyIsoCode;

  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? pendingDeleteUntil;

  ProductDto({
    required this.id,
    required this.name,
    required this.defaultPrice,
    required this.purchasePrice,
    required this.stock,

    required this.currencyIsoCode,

    required this.createdAt,
    required this.updatedAt,
    this.pendingDeleteUntil,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Product toEntity() {
    final currency = getIt.get<CurrencyProvider>().loadCurrency(
      currencyIsoCode,
    );

    return Product(
      id: id,
      name: name,
      defaultPrice: Money.fromIntWithCurrency(defaultPrice, currency),
      purchasePrice: Money.fromIntWithCurrency(purchasePrice, currency),
      stock: stock,
    );
  }
}
