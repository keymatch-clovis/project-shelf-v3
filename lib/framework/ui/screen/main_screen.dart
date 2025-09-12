import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen(this.navigationShell, {super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.category_outlined),
            selectedIcon: const Icon(Icons.category_rounded),
            label: localizations.products,
          ),
          NavigationDestination(
            icon: const Icon(Icons.group_outlined),
            selectedIcon: const Icon(Icons.group_rounded),
            label: localizations.customers,
          ),
          NavigationDestination(
            icon: const Icon(Icons.receipt_outlined),
            selectedIcon: const Icon(Icons.receipt_rounded),
            label: localizations.invoices,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings_rounded),
            label: localizations.settings,
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
