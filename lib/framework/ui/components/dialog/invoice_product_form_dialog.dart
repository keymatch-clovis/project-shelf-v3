import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/dto/ui/invoice_product_form_dialog_result_dto.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/riverpod/invoice/invoice_product_form_provider.dart';
import 'package:project_shelf_v3/framework/ui/common/currency_input_formatter.dart';
import 'package:project_shelf_v3/framework/ui/common/validation_error_parser.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_object_field.dart';
import 'package:project_shelf_v3/framework/ui/components/dialog/accept_dialog.dart';
import 'package:project_shelf_v3/framework/ui/components/shelf_text_field.dart';

final class InvoiceProductFormDialog extends ConsumerWidget {
  final InvoiceProductFormArgs args;

  const InvoiceProductFormDialog(this.args, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final provider = invoiceProductFormProvider(args);
    final state = ref.watch(provider);

    return state.when(
      data: (data) => _Dialog(
        data,
        onUnitPriceChanged: ref.read(provider.notifier).setUnitPrice,
        onQuantityChanged: ref.read(provider.notifier).setQuantity,
        onDismissed: () => Navigator.pop(
          context,
          InvoiceProductFormDialogResultDto(
            action: InvoiceProductFormDialogAction.DISMISS,
          ),
        ),
        onSubmitted: () => Navigator.pop(
          context,
          InvoiceProductFormDialogResultDto(
            invoiceProduct: data.invoiceProduct,
            action: InvoiceProductFormDialogAction.EDIT,
          ),
        ),
        onDelete: () {
          showDialog<bool>(
            context: context,
            builder: (_) => AcceptDialog(
              title: localizations.delete_invoice_product,
              onAccept: () {},
            ),
          ).then((it) {
            if (context.mounted) {
              if (it == true) {
                final state = ref.read(provider);

                Navigator.pop(
                  context,
                  InvoiceProductFormDialogResultDto(
                    invoiceProduct: state.value!.invoiceProduct,
                    action: InvoiceProductFormDialogAction.DELETE,
                  ),
                );
              }
            }
          });
        },
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
  final void Function() onDelete;

  const _Dialog(
    this.state, {
    required this.onUnitPriceChanged,
    required this.onQuantityChanged,
    required this.onDismissed,
    required this.onSubmitted,
    required this.onDelete,
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
                    body: Text(
                      state.productInput.value.map((it) => it.name).unwrap(),
                    ),
                    label: localizations.product,
                  ),
                  ShelfTextField(
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
                  ShelfTextField(
                    isRequired: true,
                    value: state.quantityInput.value,
                    label: localizations.quantity,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    errors: state.quantityInput.errors.parseErrors(context),
                    onChanged: onQuantityChanged,
                  ),
                ],
              ),
            ),
            const Divider(),
            _Total(state.invoiceProduct.total),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 4,
              children: [
                if (state.tempId.isSome()) ...[
                  IconButton(
                    icon: const Icon(Icons.delete_outlined),
                    onPressed: onDelete,
                  ),
                ],
                Row(
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
