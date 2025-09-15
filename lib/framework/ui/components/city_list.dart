import 'package:flutter/material.dart';
import 'package:project_shelf_v3/app/entity/city.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

final class CityList extends StatelessWidget {
  final List<City> items;
  final void Function(City)? onTap;

  const CityList({super.key, required this.items, this.onTap});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_rounded,
              size: 96,
              color: theme.colorScheme.outlineVariant,
            ),
            Text(
              localizations.no_cities_found,
              style: TextStyle(color: theme.colorScheme.outline),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      separatorBuilder: (_, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return _ListTile(items[index], onTap: onTap);
      },
    );
  }
}

final class _ListTile extends StatelessWidget {
  final City city;
  final void Function(City)? onTap;

  const _ListTile(this.city, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap?.call(city),
      title: Text(city.name),
      subtitle: Text(city.department),
    );
  }
}
