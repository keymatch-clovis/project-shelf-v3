import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/view_model/common/input.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/ui/common/currency_input_formatter.dart';
import 'package:project_shelf_v3/framework/ui/common/view_model_error_parser.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_text_field.dart';

class ProductForm extends StatelessWidget {
  final Input nameInput;
  final void Function(String value) onNameChanged;

  final Input defaultPriceInput;
  final void Function(String value) onDefaultPriceChanged;

  final Input stockInput;
  final void Function(String value) onStockChanged;

  const ProductForm({
    super.key,
    required this.nameInput,
    required this.onNameChanged,

    required this.defaultPriceInput,
    required this.onDefaultPriceChanged,

    required this.stockInput,
    required this.onStockChanged,
  });

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    // FIXME: This should be different.
    final currency = Currency.create('COP', 0, pattern: '#,##0');

    return Padding(
      // https://m3.material.io/components/dialogs/specs#2b93ced7-9b0d-4a59-9bc4-8ff59dcd24c1
      padding: EdgeInsetsGeometry.all(24),
      child: Column(
        spacing: 12,
        children: [
          CustomTextField(
            label: localizations.name,
            value: nameInput.value,
            onChanged: onNameChanged,
            onClear: () => onNameChanged(""),
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            errors: nameInput.errors.parseErrors(context),
          ),
          CustomTextField(
            label: localizations.default_price,
            value: defaultPriceInput.value,
            onChanged: onDefaultPriceChanged,
            onClear: () => onDefaultPriceChanged(""),
            keyboardType: TextInputType.number,
            errors: defaultPriceInput.errors.parseErrors(context),
            textInputAction: TextInputAction.next,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatter(currency: currency),
            ],
          ),
          CustomTextField(
            label: localizations.stock,
            value: stockInput.value,
            onChanged: onStockChanged,
            onClear: () => onStockChanged(""),
            keyboardType: TextInputType.number,
            errors: stockInput.errors.parseErrors(context),
            textInputAction: TextInputAction.done,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ],
      ),
    );
  }
}
