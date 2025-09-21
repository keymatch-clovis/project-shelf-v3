import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/adapter/dto/ui/product_dto.dart';
import 'package:project_shelf_v3/app/use_case/product/search_products_use_case.dart';
import 'package:project_shelf_v3/main.dart';
import 'package:rxdart/rxdart.dart';

final class ProductSearchDelegate extends SearchDelegate {
  final _useCase = getIt.get<SearchProductsUseCase>();
  final _queryController = BehaviorSubject<String>();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => context.pop(),
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final stream = _useCase
        .exec(query: query)
        .map((it) => it.map(ProductDto.fromEntity));

    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _List(snapshot.data?.toList() ?? const []);
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final stream = _queryController.stream
        .debounceTime(Duration(milliseconds: 300))
        .switchMap((it) => _useCase.exec(query: it))
        .map((it) => it.map(ProductDto.fromEntity));

    _queryController.add(query);

    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _List(snapshot.data?.toList() ?? const []);
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

final class _List extends StatelessWidget {
  final List<ProductDto> items;

  const _List(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      separatorBuilder: (_, index) {
        return const Divider(height: 1);
      },
      itemBuilder: (context, index) {
        return ListTile(title: Text(items[index].name));
      },
    );
  }
}
