import 'package:money2/money2.dart';

class Product {
  final int id;
  final String name;
  final Money defaultPrice;
  final int stock;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? pendingDeleteUntil;

  Product({
    required this.id,
    required this.name,
    required this.defaultPrice,
    required this.stock,
    required this.createdAt,
    required this.updatedAt,
    this.pendingDeleteUntil,
  });
}