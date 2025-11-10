import 'package:money2/money2.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class Product {
  static const MAX_NAME_SIZE = 255;

  final Id id;
  final String name;
  final Money defaultPrice;
  final Money purchasePrice;
  final int stock;

  const Product({
    required this.id,
    required this.name,
    required this.defaultPrice,
    required this.purchasePrice,
    required this.stock,
  });
}
