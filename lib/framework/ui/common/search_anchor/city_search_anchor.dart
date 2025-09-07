import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/framework/riverpod/ui_controller/city/city_search_controller.dart';

class CitySearchAnchor extends ConsumerStatefulWidget {
  const CitySearchAnchor({super.key});

  @override
  ConsumerState<CitySearchAnchor> createState() => _CitySearchState();
}

class _CitySearchState extends ConsumerState<CitySearchAnchor> {
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
      viewBuilder: (_) => Consumer(
        builder: (_, ref, _) {
          final asyncValue = ref.watch(
            citySearchProvider(_searchController.text),
          );

          return asyncValue.when(
            data: (items) {
              if (items.isEmpty) {
                // TODO: FIX THIS MF
                return Center(child: Text("no data"));
              }

              return ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: items.length,
                separatorBuilder: (_, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index].name),
                    onTap: () {
                      _searchController.closeView(null);
                    },
                  );
                },
              );
            },
            loading: () {
              return Padding(
                padding: EdgeInsetsGeometry.all(8),
                child: Center(child: const CircularProgressIndicator()),
              );
            },
            error: (err, _) => Text(err.toString()),
          );
        },
      ),
      suggestionsBuilder: (_, _) => [],
    );
  }
}
