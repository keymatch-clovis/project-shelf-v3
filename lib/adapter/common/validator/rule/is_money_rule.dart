import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/common/validator/validation_error.dart';
import 'package:project_shelf_v3/adapter/common/validator/validation_rule.dart';
import 'package:project_shelf_v3/common/currency_extensions.dart';

final class IsMoneyRule extends ValidationRule<String> {
  @override
  String get name => "IS_MONEY_RULE";

  @override
  ValidationError get error => ValidationError.INVALID_DECIMAL_VALUE;

  final Currency _currency;

  const IsMoneyRule(this._currency);

  @override
  ValidationError? validate(String? value) {
    if (value?.isEmpty == true) {
      return null;
    }

    if (value != null) {
      if (_currency.tryParse(value) == null) {
        return error;
      }
    }
    return null;
  }
}
