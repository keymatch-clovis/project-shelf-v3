import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

class UpdateProductRequest {
  final Id id;
  final String name;
  final Option<Money> defaultPrice;
  final Option<Money> purchasePrice;
  final Option<int> stock;

  UpdateProductRequest({
    required this.id,
    required this.name,
    Money? defaultPrice,
    Money? purchasePrice,
    int? stock,
  }) : defaultPrice = Option.from(defaultPrice),
       purchasePrice = Option.from(purchasePrice),
       stock = Option.from(stock);
}
