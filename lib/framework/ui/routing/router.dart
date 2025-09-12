import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/ui/screen/main_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/create_product_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/edit_product_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/product_list_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/product_details_screen.dart';

enum CustomRoute {
  PRODUCT(route: "/product", part: "product"),
  PRODUCT_DETAILS(route: "/product/details", part: "details"),
  PRODUCT_EDIT(route: "/product/details/edit", part: "edit"),
  PRODUCT_CREATE(route: "/product/create", part: "create");

  final String route;
  final String part;

  const CustomRoute({required this.route, required this.part});
}

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
  initialLocation: CustomRoute.PRODUCT.route,
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProductKey,
          routes: [
            GoRoute(
              path: CustomRoute.PRODUCT.route,
              pageBuilder: (_, _) {
                return const NoTransitionPage(child: ProductListScreen());
              },
              routes: [
                GoRoute(
                  path: CustomRoute.PRODUCT_CREATE.part,
                  builder: (_, _) {
                    return const CreateProductScreen();
                  },
                ),
                GoRoute(
                  path: CustomRoute.PRODUCT_DETAILS.part,
                  builder: (_, _) {
                    return const ProductDetailsScreen();
                  },
                  routes: [
                    GoRoute(
                      path: CustomRoute.PRODUCT_EDIT.part,
                      builder: (_, _) {
                        return const EditProductScreen();
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
