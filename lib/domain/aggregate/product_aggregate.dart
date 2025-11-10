import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';
import 'package:project_shelf_v3/domain/entity/product.dart';

final class ProductAggregate {
  final String name;
  final Money defaultPrice;
  final Money purchasePrice;
  final int stock;

  ProductAggregate(
    Currency currency, {
    required String name,
    required Option<Money> defaultPrice,
    required Option<Money> purchasePrice,
    required Option<int> stock,
  }) : name = name.trim().toUpperCase(),
       defaultPrice = defaultPrice.unwrapOr(currency.zero),
       purchasePrice = purchasePrice.unwrapOr(currency.zero),
       stock = stock.unwrapOr(0) {
    assert(name.length <= Product.MAX_NAME_SIZE);
    assert(!this.defaultPrice.isNegative);
    assert(!this.purchasePrice.isNegative);

    // NOTE: We are not checking the stock, as we want to me flexible with this
    // value.
    //
    // assert(this.stock >= 0);
  }
}
