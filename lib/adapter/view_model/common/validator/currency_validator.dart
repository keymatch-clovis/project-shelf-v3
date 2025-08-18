import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/view_model/common/validator/validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_error.dart';

class CurrencyValidator implements Validator<String> {
  final Currency currency;

  @override
  final bool isRequired;

  CurrencyValidator(this.currency, {this.isRequired = false});

  @override
  List<ViewModelError> validate(String value) {
    List<ViewModelError> errors = [];
    Money? transformed;

    try {
      transformed = currency.parse(value);
    } on Exception {
      transformed = null;
    }

    if (isRequired) {
      if (value.isEmpty) {
        errors.add(ViewModelError.blankValue);
      }

      if (transformed == null) {
        errors.add(ViewModelError.invalidDecimalValue);
      }
    }
    // If the this is not null, we have to check the inside of the string, to see
    // if it is what we expect.
    else if (value.isNotEmpty && transformed == null) {
      errors.add(ViewModelError.invalidDecimalValue);
    }

    return errors;
  }
}
