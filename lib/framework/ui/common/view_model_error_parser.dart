import 'package:flutter/material.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_error.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

extension ViewModelErrorParser on Set<ViewModelError> {
  List<String> parseErrors(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return map((error) {
      return switch (error) {
        ViewModelError.nullValue => localizations.err_value_required,
        ViewModelError.blankValue => localizations.err_blank_value,
        ViewModelError.invalidDecimalValue =>
          localizations.err_invalid_decimal_value,
        ViewModelError.invalidIntegerValue =>
          localizations.err_invalid_integer_value,
        ViewModelError.negativeValue => localizations.err_negative_value,
        ViewModelError.notEnoughProductStock =>
          localizations.err_not_enough_stock,
        ViewModelError.productNameTaken => localizations.err_product_name_taken,
      };
    }).toList();
  }
}

