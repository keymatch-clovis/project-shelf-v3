import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

final class Product {
  static const MAX_NAME_SIZE = 255;

  Option<Id> id;
  String name;
  Money defaultPrice;
  Money purchasePrice;
  int stock;

  Product({
    required this.id,
    required String name,
    required this.defaultPrice,
    required this.purchasePrice,
    required this.stock,
  }) : name = name.trim().toUpperCase() {
    assert(!defaultPrice.isNegative);
    assert(!purchasePrice.isNegative);
    assert(stock >= 0);

    assert(name.length <= MAX_NAME_SIZE);

    assert(defaultPrice.isInSameCurrencyAs(purchasePrice));
  }
}
