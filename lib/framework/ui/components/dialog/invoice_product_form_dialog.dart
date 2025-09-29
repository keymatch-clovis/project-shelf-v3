import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/invoice_product_form_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/currency_input_formatter.dart';
import 'package:project_shelf_v3/framework/ui/common/validation_error_parser.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_object_field.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_text_field.dart';

final class InvoiceProductFormDialog extends ConsumerWidget {
  final InvoiceProductFormArgs args;

  const InvoiceProductFormDialog(this.args, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = invoiceProductFormProvider(args);
    final state = ref.watch(provider);

    return state.when(
      data: (data) => _Dialog(
        data,
        onUnitPriceChanged: ref.read(provider.notifier).setUnitPrice,
        onQuantityChanged: ref.read(provider.notifier).setQuantity,
        onDismissed: () => Navigator.pop(context),
        onSubmitted: () => Navigator.pop(context, data.invoiceProduct),
      ),
      loading: () => const _LoadingDialog(),
      error: (err, _) {
        Logger().f(err);
        throw AssertionError(err);
      },
    );
  }
}

final class _Dialog extends StatelessWidget {
  final InvoiceProductFormState state;
  final void Function(String) onUnitPriceChanged;
  final void Function(String) onQuantityChanged;
  final void Function() onDismissed;
  final void Function() onSubmitted;

  const _Dialog(
    this.state, {
    required this.onUnitPriceChanged,
    required this.onQuantityChanged,
    required this.onDismissed,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: theme.colorScheme.surface,
      child: Padding(
        // https://m3.material.io/components/dialogs/specs#9a8c226b-19fa-4d6b-894e-e7d5ca9203e8
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(localizations.add_product, style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                children: [
                  CustomObjectField(
                    isRequired: true,
                    body: Text(state.productInput.value!.name),
                    label: localizations.product,
                  ),
                  CustomTextField(
                    isRequired: true,
                    textInputAction: TextInputAction.next,
                    value: state.unitPriceInput.value,
                    label: localizations.unit_price,
                    keyboardType: TextInputType.number,
                    errors: state.unitPriceInput.errors.parseErrors(context),
                    onChanged: onUnitPriceChanged,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CurrencyInputFormatter(currency: state.currency),
                    ],
                  ),
                  CustomTextField(
                    isRequired: true,
                    value: state.quantityInput.value,
                    label: localizations.quantity,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    errors: state.quantityInput.errors.parseErrors(context),
                    helperText: localizations.current_product_stock(
                      state.availableStock!,
                    ),
                    onChanged: onQuantityChanged,
                  ),
                ],
              ),
            ),
            const Divider(),
            _Total(state.invoiceProduct?.total),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 4,
              children: [
                TextButton(
                  onPressed: onDismissed,
                  child: Text(localizations.close),
                ),
                FilledButton(
                  onPressed: state.isValid ? onSubmitted : null,
                  child: Text(localizations.accept),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final class _LoadingDialog extends StatelessWidget {
  const _LoadingDialog();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog(
      backgroundColor: theme.colorScheme.surface,
      child: Padding(
        // https://m3.material.io/components/dialogs/specs#9a8c226b-19fa-4d6b-894e-e7d5ca9203e8
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [const Center(child: CircularProgressIndicator())],
        ),
      ),
    );
  }
}

final class _Total extends StatelessWidget {
  final Money? total;

  const _Total(this.total);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(localizations.total, style: theme.textTheme.titleMedium),
        total == null ? Text("—") : Text(total.toString()),
      ],
    );
  }
}
