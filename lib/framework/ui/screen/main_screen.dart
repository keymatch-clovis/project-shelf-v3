import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/bloc/app_preferences_bloc.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

class MainScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // NOTE: These are the main providers for the whole app. These can be
      // considered as 'global state' something like redux. This is not very
      // much recommended, but we can use this for smaller blocs, in my
      // opinion.
      // See more:
      // https://github.com/felangel/bloc/issues/1072#issuecomment-618682862
      providers: [
        BlocProvider(
          create: (_) => AppPreferencesBloc()..add(PreferencesFetched()),
          lazy: false,
        ),
      ],
      child: _MainScreenView(navigationShell),
    );
  }
}

class _MainScreenView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const _MainScreenView(this.navigationShell);

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
