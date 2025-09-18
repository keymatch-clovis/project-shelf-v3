import 'package:project_shelf_v3/common/typedefs.dart';

class UpdateProductRequest {
  final Id id;
  final String name;
  final int? defaultPrice;
  final int? purchasePrice;
  final int? stock;

  UpdateProductRequest({
    required this.id,
    required this.name,
    this.defaultPrice,
    this.purchasePrice,
    this.stock,
  });
}
