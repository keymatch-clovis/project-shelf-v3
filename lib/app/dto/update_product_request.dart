import 'package:money2/money2.dart';
import 'package:project_shelf_v3/common/typedefs.dart';

class UpdateProductRequest {
  final Id id;
  final String name;
  final Money? defaultPrice;
  final Money? purchasePrice;
  final int? stock;

  UpdateProductRequest({
    required this.id,
    required this.name,
    this.defaultPrice,
    this.purchasePrice,
    this.stock,
  });

  @override
  String toString() {
    return "[$id], name=$name, defaultPrice=$defaultPrice, purchasePrice=$purchasePrice, stock=$stock";
  }
}
