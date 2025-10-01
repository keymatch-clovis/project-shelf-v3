import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/invoice_list_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/selected_invoice_draft_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/selected_invoice_provider.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

final class InvoiceListScreen extends ConsumerWidget {
  const InvoiceListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Add any listeners here.

    return _Screen(
      onSelected: (invoice) {
        ref.read(selectedInvoiceProvider.notifier).select(invoice.invoice);
        context.go(CustomRoute.INVOICE_DETAILS.route);
      },
    );
  }
}

final class _Screen extends ConsumerWidget {
  final void Function(InvoiceWithCustomerDto) onSelected;

  const _Screen({required this.onSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.invoices),
        actions: [
          IconButton(
            onPressed: () => context.go(CustomRoute.INVOICE_DRAFTS.route),
            icon: const Icon(Icons.history_outlined),
          ),
        ],
      ),
      body: _Body(onSelected: onSelected),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //  > Modifying other providers during init is the wrong architecture.
          //  > https://github.com/rrousselGit/riverpod/issues/1505#issuecomment-1191878788
          //
          // As such, we can't just change the selected draft invoice for
          // creation (if there was one selected at this moment) when we are
          // building the provider for invoice creation. We need to do that
          // here first.
          ref.read(selectedInvoiceDraftProvider.notifier).clear();

          context.go(CustomRoute.INVOICE_CREATE.route);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

final class _Body extends ConsumerWidget {
  final void Function(InvoiceWithCustomerDto) onSelected;

  const _Body({required this.onSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invoiceListProvider);

    return state.when(
      data: (items) => _List(items, onSelected: onSelected),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
    );
  }
}

final class _List extends ConsumerWidget {
  final List<InvoiceWithCustomerDto> items;

  final void Function(InvoiceWithCustomerDto) onSelected;

  const _List(this.items, {required this.onSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_rounded,
              size: 96,
              color: theme.colorScheme.outlineVariant,
            ),
            Text(
              localizations.no_invoices_found,
              style: TextStyle(color: theme.colorScheme.outline),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (context, index) {
        return _ListTile(items[index], onSelected: onSelected);
      },
    );
  }
}

final class _ListTile extends StatelessWidget {
  final InvoiceWithCustomerDto item;

  final void Function(InvoiceWithCustomerDto) onSelected;

  const _ListTile(this.item, {required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onSelected(item),
      title: Text("test: ${item.invoice.number}"),
    );
  }
}
