import 'package:money2/money2.dart';

const MAX_PRODUCT_NAME_SIZE = 128;

class Product {
  final int? id;
  final String name;
  final Money defaultPrice;
  final Money purchasePrice;
  final int stock;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? pendingDeleteUntil;

  Product({
    required this.name,
    required this.defaultPrice,
    required this.purchasePrice,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,

    this.id,
    this.pendingDeleteUntil,
  });
}
