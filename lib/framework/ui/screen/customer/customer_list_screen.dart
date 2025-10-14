import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/customer_list_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/customer_search_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/selected_customer_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/components/customer_list_tile.dart';
import 'package:project_shelf_v3/framework/ui/components/customer_search_list.dart';
import 'package:project_shelf_v3/framework/ui/components/shelf_search_bar.dart';
import 'package:project_shelf_v3/framework/ui/components/sliver_header_delegate.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

class CustomerListScreen extends ConsumerStatefulWidget {
  const CustomerListScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CustomerListScreenState();
  }
}

class _CustomerListScreenState extends ConsumerState<CustomerListScreen> {
  late SearchController searchController;

  @override
  void initState() {
    super.initState();

    searchController = SearchController();
  }

  @override
  Widget build(BuildContext context) {
    // This search provider by itself is useless, as it is marked as
    // autodispose. This means this widget is dependent on a parent widget
    // listening to the search provider.
    // This is created this way to make the search provider constrained to the
    // views using it.
    //
    // NOTE: I don't know another way of doing this.
    ref.listen(customerSearchProvider, (_, _) {});

    return _Screen(
      searchController: searchController,
      onCreate: () => context.go(CustomRoute.CUSTOMER_CREATE.route),
      onSearchCustomer: ref.read(customerSearchProvider.notifier).updateQuery,
      onCustomerSelected: (customer) {
        if (searchController.isOpen) {
          searchController.clear();
          searchController.closeView(null);

          // I think we need to do this because the search controller is
          // closing a route, so we need to do this after the route has closed.
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => FocusScope.of(context).unfocus(),
          );
        }

        ref.read(selectedCustomerProvider.notifier).select(customer);
        context.go(CustomRoute.CUSTOMER_DETAILS.route);
      },
    );
  }
}

final class _Screen extends StatelessWidget {
  final SearchController searchController;

  final void Function() onCreate;
  final void Function(String) onSearchCustomer;
  final void Function(CustomerDto) onCustomerSelected;

  const _Screen({
    required this.searchController,

    required this.onCreate,
    required this.onSearchCustomer,
    required this.onCustomerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: COMPACT_SPACING_H,
          child: CustomScrollView(
            slivers: [
              _AppBar(
                searchController: searchController,
                onSearchCustomer: onSearchCustomer,
                onCustomerSelected: onCustomerSelected,
              ),
              _BodyPane(onCustomerSelected: onCustomerSelected),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: onCreate,
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}

final class _AppBar extends StatelessWidget {
  final SearchController searchController;

  final void Function(String) onSearchCustomer;
  final void Function(CustomerDto) onCustomerSelected;

  const _AppBar({
    required this.searchController,

    required this.onSearchCustomer,
    required this.onCustomerSelected,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SliverPersistentHeader(
      floating: true,
      delegate: SliverHeaderDelegate(
        height: SEARCH_APP_BAR_HEIGHT,
        child: ShelfSearchBar(
          consumerWidget: CustomerSearchList(onSelect: onCustomerSelected),
          hintText: localizations.search_customer,
          searchController: searchController,
          onSearch: onSearchCustomer,
        ),
      ),
    );
  }
}

final class _BodyPane extends ConsumerWidget {
  final void Function(CustomerDto) onCustomerSelected;

  const _BodyPane({required this.onCustomerSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(customerListProvider);

    return state.when(
      data: (items) {
        return _CustomerList(
          items.toList(),
          onCustomerSelected: onCustomerSelected,
        );
      },
      loading: () => SliverFillRemaining(
        hasScrollBody: false,
        fillOverscroll: true,
        child: const Center(child: CircularProgressIndicator()),
      ),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
    );
  }
}

class _CustomerList extends ConsumerWidget {
  final List<CustomerDto> items;
  final void Function(CustomerDto) onCustomerSelected;

  const _CustomerList(this.items, {required this.onCustomerSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    if (items.isEmpty) {
      return Center(child: Text(localizations.no_customers));
    }

    return SliverList.separated(
      separatorBuilder: (_, _) => const SizedBox(height: XS_SPACING),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CustomerListTile(items[index], onSelect: onCustomerSelected);
      },
    );
  }
}
