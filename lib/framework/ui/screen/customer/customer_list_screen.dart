import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/customer_list_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/selected_customer_provider.dart';
import 'package:project_shelf_v3/framework/ui/components/customer_list_tile.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

class CustomerListScreen extends StatelessWidget {
  const CustomerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.customers),
        actions: [
          // CustomerSearchAnchor(
          //   builder: (controller) {
          //     return IconButton(
          //       icon: const Icon(Icons.search),
          //       onPressed: controller.openView,
          //     );
          //   },
          // ),
        ],
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return Consumer(
              builder: (_, ref, _) {
                return ref
                    .watch(customerListProvider)
                    .when(
                      data: (items) => _CustomerList(items.toList()),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (err, _) {
                        Logger().f(err);
                        throw AssertionError(err);
                      },
                    );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => context.go(CustomRoute.CUSTOMER_CREATE.route),
      ),
    );
  }
}

class _CustomerList extends ConsumerWidget {
  final List<CustomerDto> items;

  const _CustomerList(this.items);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    if (items.isEmpty) {
      return Center(child: Text(localizations.no_customers));
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      separatorBuilder: (_, _) {
        return const Divider(height: 1);
      },
      itemBuilder: (context, index) {
        return CustomerListTile(
          dto: items[index],
          onTap: (customer) {
            ref.read(selectedCustomerProvider.notifier).select(customer);
            context.go(CustomRoute.CUSTOMER_DETAILS.route);
          },
        );
      },
    );
  }
}
