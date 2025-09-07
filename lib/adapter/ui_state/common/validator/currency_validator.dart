import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/custom_state_error.dart';
import 'package:project_shelf_v3/adapter/ui_state/common/validator/validator.dart';

class CurrencyValidator implements Validator<String> {
  final Currency currency;

  @override
  final bool isRequired;

  CurrencyValidator(this.currency, {this.isRequired = false});

  @override
  Set<CustomStateError> validate(String value) {
    Set<CustomStateError> errors = Set.identity();
    Money? transformed;

    try {
      transformed = currency.parse(value);
    } on Exception {
      transformed = null;
    }

    if (isRequired) {
      if (value.isEmpty) {
        errors.add(CustomStateError.blankValue);
      }

      if (transformed == null) {
        errors.add(CustomStateError.invalidDecimalValue);
      }
    }
    // If the this is not null, we have to check the inside of the string, to see
    // if it is what we expect.
    else if (value.isNotEmpty && transformed == null) {
      errors.add(CustomStateError.invalidDecimalValue);
    }

    return errors;
  }
}
