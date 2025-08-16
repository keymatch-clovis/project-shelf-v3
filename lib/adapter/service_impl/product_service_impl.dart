import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/repository/product_repository.dart';
import 'package:project_shelf_v3/app/service/product_service.dart';
import 'package:project_shelf_v3/comon/typedefs.dart';

class ProductServiceImpl implements ProductService {
  final ProductRepository _repository;

  ProductServiceImpl(this._repository);

  @override
  Future<Id> create({
    required String name,
    required int defaultPrice,
    required int stock,
  }) async {
    Logger().d('[IMPL] Creating product');
    return await _repository.create(
      name: name,
      defaultPrice: defaultPrice,
      stock: stock,
    );
  }
}
