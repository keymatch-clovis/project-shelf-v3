import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/invoice_list_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/selected_invoice_draft_provider.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/selected_invoice_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

final class InvoiceListScreen extends ConsumerWidget {
  const InvoiceListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Screen(
      onInvoiceDraftsNavigated: () {
        context.go(CustomRoute.INVOICE_DRAFTS.route);
      },
      onCreateNavigated: () {
        //  > Modifying other providers during init is the wrong architecture.
        //  > https://github.com/rrousselGit/riverpod/issues/1505#issuecomment-1191878788
        //
        // As such, we can't just change the selected draft invoice for
        // creation (if there was one selected at this moment) when we are
        // building the provider for invoice creation. We need to do that here
        // first.
        ref.read(selectedInvoiceDraftProvider.notifier).clear();

        context.go(CustomRoute.INVOICE_CREATE.route);
      },
      onSelect: (invoice) {
        ref.read(selectedInvoiceProvider.notifier).select(invoice.id);
        context.go(CustomRoute.INVOICE_DETAILS.route);
      },
    );
  }
}

final class _Screen extends ConsumerWidget {
  final void Function(InvoiceDto) onSelect;
  final void Function() onInvoiceDraftsNavigated;
  final void Function() onCreateNavigated;

  const _Screen({
    required this.onInvoiceDraftsNavigated,
    required this.onCreateNavigated,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.invoices),
        actions: [
          IconButton(
            onPressed: onInvoiceDraftsNavigated,
            icon: const Icon(Icons.history_outlined),
          ),
        ],
      ),
      body: _BodyPane(onSelect: onSelect),
      // https://m3.material.io/components/floating-action-button/specs
      floatingActionButton: FloatingActionButton.large(
        onPressed: onCreateNavigated,
        child: const Icon(Icons.add),
      ),
    );
  }
}

final class _BodyPane extends ConsumerWidget {
  final void Function(InvoiceDto) onSelect;

  const _BodyPane({required this.onSelect});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invoiceListProvider);

    return state.when(
      data: (items) => _List(items.toList(), onSelect: onSelect),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
    );
  }
}

final class _List extends StatelessWidget {
  final List<InvoiceDto> items;

  final void Function(InvoiceDto) onSelect;

  const _List(this.items, {required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: COMPACT_SPACING.toDouble(),
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

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _ListTile(items[index], onSelect: onSelect);
      },
    );
  }
}

final class _ListTile extends StatelessWidget {
  final InvoiceDto item;

  final void Function(InvoiceDto) onSelect;

  const _ListTile(this.item, {required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onSelect(item),
      leading: Text(item.number.toString()),
      title: Text(Jiffy.parseFromDateTime(item.date).yMMMMd),
      subtitle: Text(item.customer.getFullName()),
    );
  }
}
