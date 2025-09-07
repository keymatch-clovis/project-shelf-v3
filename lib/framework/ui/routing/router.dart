import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/ui/screen/main_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/create_product_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/product_edit_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/product_list_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/product_details_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorProductKey = GlobalKey<NavigatorState>(
  debugLabel: 'product',
);
final _shellNavigatorCustomerKey = GlobalKey<NavigatorState>(
  debugLabel: 'customer',
);
final _shellNavigatorInvoiceKey = GlobalKey<NavigatorState>(
  debugLabel: 'invoice',
);
final _shellNavigatorSettingsKey = GlobalKey<NavigatorState>(
  debugLabel: 'settings',
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
                GoRoute(
                  path: 'see',
                  builder: (context, state) {
                    return ProductDetailsScreen();
                  },
                  routes: [
                    GoRoute(
                      path: 'edit',
                      builder: (context, state) {
                        return ProductEditScreen();
                      },
                    ),
                  ],
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
        StatefulShellBranch(
          navigatorKey: _shellNavigatorInvoiceKey,
          routes: [
            // TODO: Change these magic strings
            GoRoute(
              path: '/invoice',
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: ProductListScreen());
              },
              routes: [],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettingsKey,
          routes: [
            // TODO: Change these magic strings
            GoRoute(
              path: '/settings',
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
