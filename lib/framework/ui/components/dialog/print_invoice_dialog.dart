import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/invoice_printer_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/common/error_parser.dart';

final class PrintInvoiceDialog extends ConsumerWidget {
  final Id invoiceId;

  const PrintInvoiceDialog(this.invoiceId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Dialog(
      invoiceId,
      onAccept: ref.read(invoicePrinterProvider(invoiceId).notifier).print,
      onDismiss: () => Navigator.of(context).pop(),
    );
  }
}

final class _Dialog extends StatelessWidget {
  final Id invoiceId;

  final void Function() onAccept;
  final void Function()? onDismiss;

  const _Dialog(this.invoiceId, {required this.onAccept, this.onDismiss});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    // https://m3.material.io/components/dialogs/specs
    return Dialog(
      child: Padding(
        padding: MEDIUM_SPACING_ALL,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.print_invoice,
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: COMPACT_SPACING),
            _BodyPane(invoiceId, onAccept: onAccept, onDismiss: onDismiss),
          ],
        ),
      ),
    );
  }
}

final class _BodyPane extends ConsumerWidget {
  final Id invoiceId;

  final void Function() onAccept;
  final void Function()? onDismiss;

  const _BodyPane(this.invoiceId, {required this.onAccept, this.onDismiss});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(invoicePrinterProvider(invoiceId));

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err.toString());
      },
      data: (data) {
        return switch (data) {
          Failure() => _ErrorPane(data.error, onDismiss: onDismiss),
          Initial() => _FormPane(
            invoiceId,
            onAccept: onAccept,
            onDismiss: onDismiss,
          ),
        };
      },
    );
  }
}

final class _ErrorPane extends StatelessWidget {
  final Error error;

  final void Function()? onDismiss;

  const _ErrorPane(this.error, {this.onDismiss});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: MEDIUM_SPACING_H,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              error.parseIconError(),
              size: 96,
              color: theme.colorScheme.outlineVariant,
            ),
            Text(
              error.parseError(context),
              textAlign: TextAlign.center,
              style: TextStyle(color: theme.colorScheme.outline),
            ),
            const SizedBox(height: MEDIUM_SPACING),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: onDismiss,
                  child: Text(localizations.close),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final class _FormPane extends ConsumerWidget {
  final Id invoiceId;

  final void Function() onAccept;
  final void Function()? onDismiss;

  const _FormPane(this.invoiceId, {required this.onAccept, this.onDismiss});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    final state = ref.watch(
      invoicePrinterProvider(invoiceId).select((it) => it.value as Initial),
    );

    final printers = state.printers.map((it) {
      return DropdownMenuEntry(value: it.name, label: it.name);
    });

    return Column(
      children: [
        DropdownMenu(
          label: Text(localizations.printer),
          dropdownMenuEntries: printers.toList(),
        ),
        const SizedBox(height: MEDIUM_SPACING),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: XS_SPACING,
          children: [
            TextButton(onPressed: onDismiss, child: Text(localizations.cancel)),
            FilledButton(onPressed: onAccept, child: Text(localizations.print)),
          ],
        ),
      ],
    );
  }
}
