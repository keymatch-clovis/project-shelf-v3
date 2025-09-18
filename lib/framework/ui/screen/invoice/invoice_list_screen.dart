import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/app/entity/invoice.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/invoice_list_provider.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

final class InvoiceListScreen extends StatelessWidget {
  const InvoiceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Add any listeners here.

    return const _Screen();
  }
}

final class _Screen extends StatelessWidget {
  const _Screen();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(localizations.invoices)),
      body: _Body(),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () => context.go(CustomRoute.INVOICE_CREATE.route),
        child: const Icon(Icons.add),
      ),
    );
  }
}

final class _Body extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invoiceListProvider);

    return state.when(
      data: (items) => _List(items),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
    );
  }
}

final class _List extends ConsumerWidget {
  final List<Invoice> items;

  const _List(this.items);

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
              localizations.no_cities_found,
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
        return _Tile(items[index]);
      },
    );
  }
}

final class _Tile extends StatelessWidget {
  final Invoice invoice;

  const _Tile(this.invoice);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text("test: ${invoice.number}"));
  }
}
