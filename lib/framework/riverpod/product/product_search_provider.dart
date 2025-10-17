import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/app/use_case/product/search_products_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';
import 'package:rxdart/rxdart.dart';

class ProductSearchStreamNotifier extends StreamNotifier<List<ProductDto>> {
  final _useCase = getIt.get<SearchProductsUseCase>();
  final _controller = BehaviorSubject<String>();

  @override
  Stream<List<ProductDto>> build() {
    return _controller.stream
        .debounceTime(Duration(milliseconds: 300))
        .switchMap((query) => _useCase.exec(query: query))
        .map((it) => it.map(ProductDto.fromEntity).toList());
  }

  void updateQuery(String query) {
    _controller.add(query);
  }
}

final productSearchProvider = StreamNotifierProvider.autoDispose(
  ProductSearchStreamNotifier.new,
);
