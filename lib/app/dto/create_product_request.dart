import 'package:money2/money2.dart';

final class CreateProductRequest {
  final String name;
  final Money? defaultPrice;
  final Money? purchasePrice;
  final int? stock;

  CreateProductRequest({
    required this.name,
    this.defaultPrice,
    this.purchasePrice,
    this.stock,
  });
}
