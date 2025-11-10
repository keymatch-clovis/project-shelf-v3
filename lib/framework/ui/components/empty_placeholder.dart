import 'package:flutter/material.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';

final class EmptyPlaceholder extends StatelessWidget {
  final IconData icon;
  final String title;

  const EmptyPlaceholder({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: T_48, color: theme.colorScheme.outlineVariant),
          Text(
            title,
            style: theme.textTheme.titleMedium!.copyWith(
              color: theme.colorScheme.outlineVariant,
            ),
          ),
        ],
      ),
    );
  }
}
