import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/invoice_details_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/selected_invoice_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_object_field.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_text_field.dart';

final class InvoiceDetailsScreen extends ConsumerWidget {
  const InvoiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      selectedInvoiceProvider.select((it) => it as Selected),
    );

    // We need to listen to this [autoDispose] provider here, so it is shared
    // across all panes.
    //
    // NOTE: I feel this is a bit of a hack, but I don't know another way of
    // doing this.
    ref.listen(invoiceDetailsProvider(state.queryResult.id), (_, _) {});

    return _Screen(state.queryResult.id, onPrint: () {});
  }
}

final class _Screen extends ConsumerStatefulWidget {
  final Id invoiceId;
  final void Function() onPrint;

  const _Screen(this.invoiceId, {required this.onPrint});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScreenState();
}

final class _ScreenState extends ConsumerState<_Screen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                  _DetailsPane(widget.invoiceId),
                  _InvoiceProductListPane(widget.invoiceId),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: widget.onPrint,
        child: const Icon(Icons.print_rounded),
      ),
      bottomNavigationBar: const BottomAppBar(),
    );
  }
}

final class _AppBar extends ConsumerWidget {
  final TabController _tabController;

  const _AppBar(this._tabController);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedState = ref.watch(
      selectedInvoiceProvider.select((it) => it as Selected),
    );

    final localizations = AppLocalizations.of(context)!;
    return SliverAppBar(
      title: Text(localizations.invoice(selectedState.queryResult.number)),
      bottom: TabBar.secondary(
        controller: _tabController,
        tabs: [
          const Tab(icon: Icon(Icons.notes_outlined)),
          const Tab(icon: Icon(Icons.category_outlined)),
        ],
      ),
    );
  }
}

final class _DetailsPane extends ConsumerWidget {
  final Id invoiceId;

  const _DetailsPane(this.invoiceId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    final state = ref.watch(invoiceDetailsProvider(invoiceId));

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
      data: (data) {
        return SingleChildScrollView(
          child: Padding(
            padding: MEDIUM_SPACING_ALL,
            child: Column(
              spacing: COMPACT_SPACING.toDouble(),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  readOnly: true,
                  label: localizations.number,
                  value: data.invoice.number.toString(),
                ),
                CustomTextField(
                  readOnly: true,
                  label: localizations.date,
                  value: data.invoice.date.toString(),
                ),
                CustomObjectField(
                  label: localizations.customer,
                  value: data.invoice.customer,
                  body: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.invoice.customer.name),
                        if (data.invoice.customer.businessName != null)
                          Text(data.invoice.customer.businessName!),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

final class _InvoiceProductListPane extends ConsumerWidget {
  final Id invoiceId;

  const _InvoiceProductListPane(this.invoiceId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invoiceDetailsProvider(invoiceId));

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
      data: (data) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: data.invoice.invoiceProducts.length,
                itemBuilder: (_, index) {
                  final it = data.invoice.invoiceProducts[index];

                  return ListTile(
                    title: Text(it.product.name),
                    subtitle: Text(it.unitPrice.toString()),
                    leading: Text("${it.quantity} ×"),
                    trailing: Text(it.total.toString()),
                  );
                },
              ),
            ),
            Divider(
              height: 0,
              indent: COMPACT_SPACING.toDouble(),
              endIndent: COMPACT_SPACING.toDouble(),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text("TOTAL: ${data.total}")],
              ),
            ),
          ],
        );
      },
    );
  }
}
