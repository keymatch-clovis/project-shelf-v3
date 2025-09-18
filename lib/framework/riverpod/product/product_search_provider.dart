import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/app/use_case/product/search_products_use_case.dart';
import 'package:project_shelf_v3/common/debouncer.dart';
import 'package:project_shelf_v3/main.dart';

/// Provider related
class ProductSearchNotifier extends StreamNotifier<List<ProductDto>> {
  final _useCase = getIt.get<SearchProductsUseCase>();
  final _debouncer = Debouncer();

  String _query = "";

  @override
  Stream<List<ProductDto>> build() {
    return _useCase.exec(query: _query);
  }

  Future<void> updateQuery(String query) async {
    _debouncer.debounce(() {
      _query = query;
      ref.invalidateSelf();
    });

    await _debouncer.completer.future;
  }
}

final productSearchProvider = StreamNotifierProvider.autoDispose(
  ProductSearchNotifier.new,
);
