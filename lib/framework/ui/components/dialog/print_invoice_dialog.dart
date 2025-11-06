import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/dto/ui/printer_data_dto.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/invoice_printer_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/common/exception_parser.dart';

final class PrintInvoiceDialog extends ConsumerWidget {
  final Id invoiceId;

  const PrintInvoiceDialog(this.invoiceId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _Dialog(
      invoiceId,
      onPrinterSelected: ref
          .read(invoicePrinterProvider(invoiceId).notifier)
          .setPrinter,
      onAccept: () {
        ref
            .read(invoicePrinterProvider(invoiceId).notifier)
            .print(AppLocalizations.of(context)!.localeName);
      },
      onDismiss: () => Navigator.of(context).pop(),
    );
  }
}

final class _Dialog extends StatelessWidget {
  final Id invoiceId;

  final void Function(PrinterDataDto?) onPrinterSelected;
  final void Function() onAccept;
  final void Function()? onDismiss;

  const _Dialog(
    this.invoiceId, {
    required this.onPrinterSelected,
    required this.onAccept,
    this.onDismiss,
  });

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
            _BodyPane(
              invoiceId,
              onPrinterSelected: onPrinterSelected,
              onAccept: onAccept,
              onDismiss: onDismiss,
            ),
          ],
        ),
      ),
    );
  }
}

final class _BodyPane extends ConsumerWidget {
  final Id invoiceId;

  final void Function(PrinterDataDto?) onPrinterSelected;
  final void Function() onAccept;
  final void Function()? onDismiss;

  const _BodyPane(
    this.invoiceId, {
    required this.onPrinterSelected,
    required this.onAccept,
    this.onDismiss,
  });

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
          FailureState() => _ExceptionPane(
            data.exception,
            onDismiss: onDismiss,
          ),
          InitialState() => _FormPane(
            invoiceId,
            onPrinterSelected: onPrinterSelected,
            onAccept: onAccept,
            onDismiss: onDismiss,
          ),
        };
      },
    );
  }
}

final class _ExceptionPane extends StatelessWidget {
  final Exception exception;

  final void Function()? onDismiss;

  const _ExceptionPane(this.exception, {this.onDismiss});

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
              exception.parseIcon(),
              size: 96,
              color: theme.colorScheme.outlineVariant,
            ),
            Text(
              exception.parseException(context),
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

  final void Function(PrinterDataDto?) onPrinterSelected;
  final void Function() onAccept;
  final void Function()? onDismiss;

  const _FormPane(
    this.invoiceId, {
    required this.onPrinterSelected,
    required this.onAccept,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;

    final state = ref.watch(
      invoicePrinterProvider(
        invoiceId,
      ).select((it) => it.value as InitialState),
    );

    final printers = state.printers.map((it) {
      return DropdownMenuEntry(value: it.macAddress, label: it.name);
    });

    return Column(
      children: [
        DropdownMenu(
          label: Text(localizations.printer),
          dropdownMenuEntries: printers.toList(),
          onSelected: (value) {
            onPrinterSelected(
              state.printers.firstWhere((it) => it.macAddress == value),
            );
          },
        ),
        const SizedBox(height: MEDIUM_SPACING),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: XS_SPACING,
          children: [
            TextButton(onPressed: onDismiss, child: Text(localizations.cancel)),
            FilledButton(
              style: ButtonStyle(),
              onPressed: onAccept,
              child: Text(localizations.print),
            ),
          ],
        ),
      ],
    );
  }
}
