import 'package:flutter/material.dart';
import 'package:project_shelf_v3/adapter/common/validator/validation_error.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

extension ValidationErrorParser on Set<ValidationError> {
  List<String> parseErrors(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    return map((error) {
      return switch (error) {
        ValidationError.NULL_VALUE => localizations.err_value_required,
        ValidationError.BLANK_VALUE => localizations.err_blank_value,
        ValidationError.INVALID_DECIMAL_VALUE =>
          localizations.err_invalid_decimal_value,
        ValidationError.INVALID_INTEGER_VALUE =>
          localizations.err_invalid_integer_value,
        ValidationError.NEGATIVE_VALUE => localizations.err_negative_value,
        ValidationError.NOT_ENOUGH_PRODUCT_STOCK =>
          localizations.err_not_enough_stock,
        ValidationError.PRODUCT_NAME_TAKEN =>
          localizations.err_product_name_taken,
        ValidationError.VALUE_TOO_BIG => localizations.err_not_enough_stock,
      };
    }).toList();
  }
}
