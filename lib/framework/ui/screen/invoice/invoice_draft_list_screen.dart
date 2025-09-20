import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_draft_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/invoice_draft_list_provider.dart';

final class InvoiceDraftListScreen extends StatelessWidget {
  const InvoiceDraftListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Screen();
  }
}

final class _Screen extends ConsumerWidget {
  const _Screen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final mode = ref.watch(invoiceDraftListProvider.select((it) => it.mode));

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        if (mode == InvoiceDraftListMode.SELECT) {
          ref
              .read(invoiceDraftListProvider.notifier)
              .setMode(InvoiceDraftListMode.LIST);
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(localizations.invoice_drafts),
          leading: mode == InvoiceDraftListMode.SELECT
              ? IconButton(
                  onPressed: () => ref
                      .read(invoiceDraftListProvider.notifier)
                      .setMode(InvoiceDraftListMode.LIST),
                  icon: const Icon(Icons.close_rounded),
                )
              : null,
          actions: [_SelectAction(), _DeleteAction()],
        ),
        body: _Body(),
      ),
    );
  }
}

final class _DeleteAction extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invoiceDraftListProvider);

    if (state.mode != InvoiceDraftListMode.SELECT) {
      return const SizedBox.shrink();
    }

    return IconButton(
      onPressed: state.selected.isNotEmpty
          ? () => ref.read(invoiceDraftListProvider.notifier).deleteSelected()
          : null,
      icon: const Icon(Icons.delete_forever_outlined),
    );
  }
}

final class _SelectAction extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invoiceDraftListProvider);

    if (state.items.isLoading || state.mode != InvoiceDraftListMode.SELECT) {
      return const SizedBox.shrink();
    }

    if (state.items.value!.length == state.selected.length) {
      return IconButton(
        onPressed: () =>
            ref.read(invoiceDraftListProvider.notifier).deselectAll(),
        icon: const Icon(Icons.deselect_outlined),
      );
    } else {
      return IconButton(
        onPressed: () =>
            ref.read(invoiceDraftListProvider.notifier).selectAll(),
        icon: const Icon(Icons.select_all_outlined),
      );
    }
  }
}

final class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(invoiceDraftListProvider.select((it) => it.items));

    return items.when(
      data: (items) => _List(items),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
    );
  }
}

final class _List extends StatelessWidget {
  final List<InvoiceDraftDto> items;

  const _List(this.items);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history_toggle_off_rounded,
              size: 96,
              color: theme.colorScheme.outlineVariant,
            ),
            Text(
              localizations.no_invoice_drafts_found,
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

final class _Tile extends ConsumerWidget {
  final InvoiceDraftDto dto;

  const _Tile(this.dto);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invoiceDraftListProvider);

    return ListTile(
      title: Text("invoice: ${dto.date}"),
      onTap: () {
        if (state.mode == InvoiceDraftListMode.SELECT) {
          state.selected.contains(dto)
              ? ref.read(invoiceDraftListProvider.notifier).deselect(dto)
              : ref.read(invoiceDraftListProvider.notifier).select(dto);
        }
      },
      onLongPress: () =>
          ref.read(invoiceDraftListProvider.notifier).select(dto),
      trailing: state.mode == InvoiceDraftListMode.SELECT
          ? Checkbox(
              value: state.selected.contains(dto),
              onChanged: (changed) {
                changed == true
                    ? ref.read(invoiceDraftListProvider.notifier).select(dto)
                    : ref.read(invoiceDraftListProvider.notifier).deselect(dto);
              },
            )
          : null,
    );
  }
}
