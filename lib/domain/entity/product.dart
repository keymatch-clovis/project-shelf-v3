import 'package:money2/money2.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

class Product {
  String name;
  Money defaultPrice;
  Money purchasePrice;
  int stock;

  Id? id;

  Product({
    required String name,
    required this.defaultPrice,
    required this.purchasePrice,
    required this.stock,

    this.id,
  }) : name = name.trim().toUpperCase() {
    assert(!defaultPrice.isNegative);
    assert(!purchasePrice.isNegative);
    assert(stock >= 0);
  }

  factory Product.fromMoney(
    Currency currency, {
    required String name,
    Money? defaultPrice,
    Money? purchasePrice,
    int? stock,
    Id? id,
  }) {
    final zero = Money.fromIntWithCurrency(0, currency);

    return Product(
      name: name,
      defaultPrice: defaultPrice ?? zero,
      purchasePrice: purchasePrice ?? zero,
      stock: stock ?? 0,
      id: id,
    );
  }

  @override
  String toString() {
    return 'Product [$id]: name=$name, defaultPrice=$defaultPrice, purchasePrice=$purchasePrice, stock=$stock';
  }
}
