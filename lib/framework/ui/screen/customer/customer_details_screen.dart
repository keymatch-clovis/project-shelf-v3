import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';
import 'package:logger/logger.dart';
import 'package:money2/money2.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/ui/customer_details_invoice_dto.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/customer_details_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/customer/selected_customer_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/selected_invoice_provider.dart'
    as selected_invoice;
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/components/shelf_text_field.dart';
import 'package:project_shelf_v3/framework/ui/components/empty_placeholder.dart';
import 'package:project_shelf_v3/framework/ui/components/shelf_card.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

final class CustomerDetailsScreen extends ConsumerWidget {
  const CustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    // We can only reach this point if the selected customer provider has this
    // exact state. If it does not, it is a programming error.
    final status = ref.watch(
      selectedCustomerProvider.select((it) => it as SelectedState),
    );

    // This provider by itself is useless, as it is marked as autodispose. This
    // means this widget is dependent on a parent widget listening to the
    // provider.
    // This is created this way to make the provider constrained to the views
    // using it.
    //
    // NOTE: I don't know another way of doing this.
    ref.listen(customerDetailsProvider(status.customer.id), (_, _) {});

    ref.listen(selectedCustomerProvider.select((it) => it.status), (_, state) {
      switch (state) {
        case SelectedCustomerStatus.DELETED:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              showCloseIcon: true,
              content: Text(localizations.customer_deleted),
            ),
          );
        default:
        // Do nothing :p
      }
    });

    return _Screen(
      status.customer.id,
      onInvoiceSelected: (invoice) {
        ref
            .read(selected_invoice.selectedInvoiceProvider.notifier)
            .select(invoice.id);

        context.go(CustomRoute.INVOICE_DETAILS.route);
      },
    );
  }
}

final class _Screen extends StatefulWidget {
  final Id customerId;

  final void Function(CustomerDetailsInvoiceDto) onInvoiceSelected;

  const _Screen(this.customerId, {required this.onInvoiceSelected});

  @override
  State<_Screen> createState() => _ScreenState();
}

final class _ScreenState extends State<_Screen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _AppBar(_tabController),
            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: true,
              // NOTE: I don't really know why this [SizedBox] here works. If we
              // remove it, the widget fails to build.
              child: SizedBox.shrink(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _CustomerDetailsPane(widget.customerId),
                    _InvoicesPane(
                      widget.customerId,
                      onInvoiceSelected: widget.onInvoiceSelected,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final class _AppBar extends ConsumerWidget {
  final TabController _tabController;

  const _AppBar(this._tabController);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(selectedCustomerProvider);

    return switch (state) {
      NoneState() => throw AssertionError(),
      SelectedState() => SliverAppBar.medium(
        title: Text(
          state.customer.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        bottom: TabBar.secondary(
          controller: _tabController,
          tabs: [
            const Tab(icon: Icon(Icons.notes_outlined)),
            const Tab(icon: Icon(Icons.receipt_outlined)),
          ],
        ),
      ),
    };
  }
}

final class _CustomerDetailsPane extends ConsumerWidget {
  final Id customerId;

  const _CustomerDetailsPane(this.customerId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(customerDetailsProvider(customerId));

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) {
        Logger().d(err);
        throw AssertionError(err);
      },
      data: (data) {
        return SingleChildScrollView(
          child: Padding(
            // https://m3.material.io/components/dialogs/specs#2b93ced7-9b0d-4a59-9bc4-8ff59dcd24c1
            padding: EdgeInsetsGeometry.all(24),
            child: Column(
              spacing: 12,
              children: [
                ShelfTextField(
                  isRequired: true,
                  readOnly: true,
                  value: Some(data.customer.name),
                  label: localizations.name,
                ),
                ShelfTextField(
                  isRequired: true,
                  readOnly: true,
                  value: Some(
                    "${data.customer.city.name}, ${data.customer.city.department}",
                  ),
                  label: localizations.city,
                ),
                ShelfTextField(
                  readOnly: true,
                  value: data.customer.businessName,
                  enabled: data.customer.businessName.isSome(),
                  label: localizations.business_name,
                ),
                ShelfTextField(
                  readOnly: true,
                  value: data.customer.address,
                  enabled: data.customer.address.isSome(),
                  label: localizations.address,
                ),
                ShelfTextField(
                  readOnly: true,
                  enabled: data.customer.phoneNumber.isSome(),
                  value: data.customer.phoneNumber,
                  label: localizations.phone_number,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

final class _InvoicesPane extends ConsumerWidget {
  final Id customerId;

  final void Function(CustomerDetailsInvoiceDto) onInvoiceSelected;

  const _InvoicesPane(this.customerId, {required this.onInvoiceSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(customerDetailsProvider(customerId));

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
      data: (data) {
        return Padding(
          padding: COMPACT_SPACING_H,
          child: Column(
            children: [
              Expanded(
                child: _InvoiceList(
                  customerId,
                  items: data.invoices.toList(),
                  onInvoiceSelected: onInvoiceSelected,
                ),
              ),
              Padding(
                padding: S_SPACING_B,
                child: _InvoicesTotalCard(data.totalRemainingUnpaidBalance),
              ),
            ],
          ),
        );
      },
    );
  }
}

final class _InvoiceList extends StatelessWidget {
  final Id customerId;
  final List<CustomerDetailsInvoiceDto> items;

  final void Function(CustomerDetailsInvoiceDto) onInvoiceSelected;

  const _InvoiceList(
    this.customerId, {
    required this.items,
    required this.onInvoiceSelected,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    if (items.isEmpty) {
      return EmptyPlaceholder(
        icon: Icons.receipt_long_outlined,
        title: localizations.no_invoices,
      );
    }

    // Trying to follow:
    // https://m3.material.io/blog/building-with-m3-expressive
    return ListView.separated(
      padding: S_SPACING_V,
      itemCount: items.length,
      itemBuilder: (_, index) =>
          _InvoiceListTile(items[index], onSelected: onInvoiceSelected),
      separatorBuilder: (_, _) => const SizedBox(height: XS_SPACING),
    );
  }
}

final class _InvoiceListTile extends StatelessWidget {
  final CustomerDetailsInvoiceDto item;

  final void Function(CustomerDetailsInvoiceDto) onSelected;

  const _InvoiceListTile(this.item, {required this.onSelected});

  @override
  Widget build(BuildContext context) {
    // Trying to follow:
    // https://m3.material.io/blog/building-with-m3-expressive
    return Card(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: ListTile(
        onTap: () => onSelected(item),
        visualDensity: VisualDensity.compact,
        leading: Text(item.number.toString(), textAlign: TextAlign.center),
        trailing: const Icon(Icons.chevron_right_rounded),
        title: Text(Jiffy.parseFromDateTime(item.date).yMMMMd),
        subtitle: item.remainingUnpaidBalance.isNonZero
            ? Row(children: [Text(item.remainingUnpaidBalance.toString())])
            : null,
      ),
    );
  }
}

final class _InvoicesTotalCard extends StatelessWidget {
  final Money totalRemainingUnpaidBalance;

  const _InvoicesTotalCard(this.totalRemainingUnpaidBalance);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    if (totalRemainingUnpaidBalance.isZero) {
      return const SizedBox.shrink();
    }

    return ShelfCard(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  localizations.remaining_unpaid_balance,
                  style: theme.textTheme.labelLarge!.copyWith(
                    color: theme.colorScheme.outline,
                  ),
                ),
                Text(
                  totalRemainingUnpaidBalance.toString(),
                  style: theme.textTheme.displaySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
