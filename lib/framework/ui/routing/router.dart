import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/ui/screen/customer/create_customer_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/customer/customer_details_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/customer/customer_list_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/invoice/invoice_list_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/main_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/create_product_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/edit_product_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/product_list_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/product_details_screen.dart';
import 'package:project_shelf_v3/framework/ui/screen/splash_screen.dart';

enum CustomRoute {
  SPLASH(route: "/", part: "/"),

  PRODUCT(route: "/product", part: "product"),
  PRODUCT_DETAILS(route: "/product/details", part: "details"),
  PRODUCT_EDIT(route: "/product/details/edit", part: "edit"),
  PRODUCT_CREATE(route: "/product/create", part: "create"),

  CUSTOMER(route: "/customer", part: "customer"),
  CUSTOMER_DETAILS(route: "/customer/details", part: "details"),
  CUSTOMER_EDIT(route: "/customer/details/edit", part: "edit"),
  CUSTOMER_CREATE(route: "/customer/create", part: "create"),

  INVOICE(route: "/invoice", part: "invoice"),
  INVOICE_DETAILS(route: "/invoice/details", part: "details"),
  INVOICE_EDIT(route: "/invoice/details/edit", part: "edit"),
  INVOICE_CREATE(route: "/invoice/create", part: "create");

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
  initialLocation: CustomRoute.SPLASH.route,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: CustomRoute.SPLASH.route,
      builder: (_, _) {
        return const SplashScreen();
      },
    ),
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
            GoRoute(
              path: CustomRoute.CUSTOMER.route,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: CustomerListScreen());
              },
              routes: [
                GoRoute(
                  path: CustomRoute.CUSTOMER_CREATE.part,
                  builder: (_, _) => const CreateCustomerScreen(),
                ),
                GoRoute(
                  path: CustomRoute.CUSTOMER_DETAILS.part,
                  builder: (_, _) => const CustomerDetailsScreen(),
                  routes: [
                    GoRoute(
                      path: CustomRoute.CUSTOMER_EDIT.part,
                      builder: (_, _) {
                        throw UnimplementedError();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorInvoiceKey,
          routes: [
            GoRoute(
              path: CustomRoute.INVOICE.route,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: InvoiceListScreen());
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
