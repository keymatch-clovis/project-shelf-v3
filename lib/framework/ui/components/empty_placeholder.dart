import 'package:flutter/material.dart';

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
          Icon(icon, size: 96, color: theme.colorScheme.outlineVariant),
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
