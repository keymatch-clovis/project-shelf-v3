import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

class Product {
  String name;
  Money defaultPrice;
  Money purchasePrice;
  int stock;

  Option<Id> id;

  Product({
    required String name,
    required this.defaultPrice,
    required this.purchasePrice,
    required this.stock,

    Id? id,
  }) : id = Option.from(id),
       name = name.trim().toUpperCase() {
    assert(!defaultPrice.isNegative);
    assert(!purchasePrice.isNegative);
    assert(stock >= 0);

    assert(defaultPrice.isInSameCurrencyAs(purchasePrice));
  }
}
