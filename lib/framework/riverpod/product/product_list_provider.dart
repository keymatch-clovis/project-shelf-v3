import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/app/use_case/product/watch_products_use_case.dart';
import 'package:project_shelf_v3/main.dart';

final productListProvider = StreamProvider<List<ProductDto>>((ref) {
  final useCase = getIt.get<WatchProductsUseCase>();

  return useCase.exec().map((it) {
    return it.map((it) => ProductDto.fromEntity(it)).toList();
  });
});
