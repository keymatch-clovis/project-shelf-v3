import 'package:project_shelf_v3/comon/typedefs.dart';

abstract interface class ProductRepository {
  Future<Id> create({
    required String name,
    required int defaultPrice,
    required int stock,
  });
}
