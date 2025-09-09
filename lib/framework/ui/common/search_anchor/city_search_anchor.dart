import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_shelf_v3/app/entity/city.dart';
import 'package:project_shelf_v3/framework/bloc/city_search_bloc.dart';

class CitySearchAnchor extends StatefulWidget {
  const CitySearchAnchor({super.key});

  @override
  State<CitySearchAnchor> createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearchAnchor> {
  final SearchController _searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      viewPadding: EdgeInsets.zero,
      isFullScreen: true,
      textCapitalization: TextCapitalization.characters,
      searchController: _searchController,
      builder: (context, controller) {
        return IconButton(
          icon: const Icon(Icons.search),
          onPressed: controller.openView,
        );
      },
      viewBuilder: (_) => BlocBuilder<CitySearchBloc, CitySearchState>(
        builder: (context, state) {
          return switch (state) {
            SearchStateEmpty() => Text("empty"),
            SearchStateLoading() => Text("loading"),
            SearchStateSuccess() => _SearchResultList(
              items: state.items,
              onTap: (item) {},
            ),
          };
        },
      ),
      suggestionsBuilder: (_, _) => [],
    );
  }
}

class _SearchResultList extends StatelessWidget {
  final List<City> items;
  final void Function(City item)? onTap;

  const _SearchResultList({required this.items, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      separatorBuilder: (_, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index].name),
          onTap: () => onTap?.call(items[index]),
        );
      },
    );
  }
}
