import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';

final class CreateProductRequest {
  final String name;
  final Option<Money> defaultPrice;
  final Option<Money> purchasePrice;
  final Option<int> stock;

  CreateProductRequest({
    required this.name,
    Money? defaultPrice,
    Money? purchasePrice,
    int? stock,
  }) : defaultPrice = Option.from(defaultPrice),
       purchasePrice = Option.from(purchasePrice),
       stock = Option.from(stock);
}
