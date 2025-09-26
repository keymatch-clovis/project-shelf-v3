import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/ui/common/currency_input_formatter.dart';
import 'package:project_shelf_v3/framework/ui/common/validation_error_parser.dart';
import 'package:project_shelf_v3/framework/ui/components/custom_text_field.dart';

class ProductDetailsForm extends StatefulWidget {
  final Currency currency;

  final Input nameInput;
  final void Function(String value) onNameChanged;

  final Input defaultPriceInput;
  final void Function(String value) onDefaultPriceChanged;

  final Input purchasePriceInput;
  final void Function(String value) onPurchasePriceChanged;

  final Input stockInput;
  final void Function(String value) onStockChanged;

  const ProductDetailsForm({
    super.key,
    required this.currency,

    required this.nameInput,
    required this.onNameChanged,

    required this.defaultPriceInput,
    required this.onDefaultPriceChanged,

    required this.purchasePriceInput,
    required this.onPurchasePriceChanged,

    required this.stockInput,
    required this.onStockChanged,
  });

  @override
  State<ProductDetailsForm> createState() => _ProductDetailsFormState();
}

class _ProductDetailsFormState extends State<ProductDetailsForm> {
  final _nameFieldFocus = FocusNode();
  final _defaultPriceFieldFocus = FocusNode();
  final _purchasePriceFieldFocus = FocusNode();
  final _stockFieldFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _nameFieldFocus.dispose();
    _defaultPriceFieldFocus.dispose();
    _purchasePriceFieldFocus.dispose();
    _stockFieldFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;

    return Padding(
      // https://m3.material.io/components/dialogs/specs#2b93ced7-9b0d-4a59-9bc4-8ff59dcd24c1
      padding: EdgeInsetsGeometry.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          CustomTextField(
            isRequired: true,
            value: widget.nameInput.value,
            label: localizations.name,
            focusNode: _nameFieldFocus,
            onFieldSubmitted: (_) => _defaultPriceFieldFocus.requestFocus(),
            onChanged: widget.onNameChanged,
            onClear: () => widget.onNameChanged(""),
            keyboardType: TextInputType.name,
            textCapitalization: TextCapitalization.characters,
            textInputAction: TextInputAction.next,
            errors: widget.nameInput.errors.parseErrors(context),
          ),
          CustomTextField(
            label: localizations.default_price,
            focusNode: _defaultPriceFieldFocus,
            value: widget.defaultPriceInput.value,
            onFieldSubmitted: (_) => _purchasePriceFieldFocus.requestFocus(),
            onChanged: widget.onDefaultPriceChanged,
            onClear: () => widget.onDefaultPriceChanged(""),
            keyboardType: TextInputType.number,
            errors: widget.defaultPriceInput.errors.parseErrors(context),
            textInputAction: TextInputAction.next,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatter(currency: widget.currency),
            ],
          ),
          CustomTextField(
            label: localizations.purchase_price,
            value: widget.purchasePriceInput.value,
            focusNode: _purchasePriceFieldFocus,
            onFieldSubmitted: (_) => _stockFieldFocus.requestFocus(),
            onChanged: widget.onPurchasePriceChanged,
            onClear: () => widget.onPurchasePriceChanged(""),
            keyboardType: TextInputType.number,
            errors: widget.purchasePriceInput.errors.parseErrors(context),
            textInputAction: TextInputAction.next,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatter(currency: widget.currency),
            ],
          ),
          CustomTextField(
            label: localizations.stock,
            value: widget.stockInput.value,
            focusNode: _stockFieldFocus,
            onChanged: widget.onStockChanged,
            onClear: () => widget.onStockChanged(""),
            keyboardType: TextInputType.number,
            errors: widget.stockInput.errors.parseErrors(context),
            textInputAction: TextInputAction.done,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ],
      ),
    );
  }
}
