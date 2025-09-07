import 'package:flutter/material.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/custom_state_error.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

extension CustomStateErrorParser on Set<CustomStateError> {
  List<String> parseErrors(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return map((error) {
      return switch (error) {
        CustomStateError.nullValue => localizations.err_value_required,
        CustomStateError.blankValue => localizations.err_blank_value,
        CustomStateError.invalidDecimalValue =>
          localizations.err_invalid_decimal_value,
        CustomStateError.invalidIntegerValue =>
          localizations.err_invalid_integer_value,
        CustomStateError.negativeValue => localizations.err_negative_value,
        CustomStateError.notEnoughProductStock =>
          localizations.err_not_enough_stock,
        CustomStateError.productNameTaken =>
          localizations.err_product_name_taken,
      };
    }).toList();
  }
}
