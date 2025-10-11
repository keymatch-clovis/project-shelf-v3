import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/common/input.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/ui/common/constants.dart';
import 'package:project_shelf_v3/framework/ui/common/currency_input_formatter.dart';
import 'package:project_shelf_v3/framework/ui/common/validation_error_parser.dart';
import 'package:project_shelf_v3/framework/ui/components/shelf_text_field.dart';

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
    padding: MEDIUM_SPACING_ALL,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: COMPACT_SPACING.toDouble(),
        children: [
          ShelfTextField(
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
          ShelfTextField(
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
          ShelfTextField(
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
          ShelfTextField(
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
