import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/ui/screen/main_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/create_product_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/product_list_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorProductKey = GlobalKey<NavigatorState>(
  debugLabel: 'product',
);
final _shellNavigatorCustomerKey = GlobalKey<NavigatorState>(
  debugLabel: 'customer',
);

final goRouter = GoRouter(
  initialLocation: '/product',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProductKey,
          routes: [
            // TODO: Change these magic strings
            GoRoute(
              path: '/product',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ProductListScreen());
              },
              routes: [
                GoRoute(
                  path: 'create',
                  builder: (context, state) {
                    return CreateProductScreen();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCustomerKey,
          routes: [
            // TODO: Change these magic strings
            GoRoute(
              path: '/customer',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ProductListScreen());
              },
              routes: [],
            ),
          ],
        ),
      ],
    ),
  ],
);
