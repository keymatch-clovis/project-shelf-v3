import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money2/money2.dart';
import 'package:project_shelf_v3/adapter/common/custom_state_error.dart';
import 'package:project_shelf_v3/adapter/common/validator/currency_validator.dart';
import 'package:project_shelf_v3/adapter/common/validator/int_validator.dart';
import 'package:project_shelf_v3/adapter/common/validator/string_validator.dart';
import 'package:project_shelf_v3/adapter/common/validator/validator.dart';

@immutable
class Input {
  final Validator<String> _validator;

  final String value;
  final Set<CustomStateError> errors;

  Input(this._validator, {String? value, Set<CustomStateError>? errors})
    : errors = errors ?? {},
      value = value ?? "" {
    // Validate the input when it is created. This prevents invalid states, as
    // when the input is invalid, but the validation has not been run.
    this.errors.addAll(_validator.validate(this.value));
  }

  Input copyWith({String? value, Set<CustomStateError>? errors}) {
    final validationErrors = _validator.validate(value ?? this.value);
    validationErrors.addAll(errors ?? {});

    return Input(
      _validator,
      value: value ?? this.value,
      errors: validationErrors,
    );
  }
}

extension MoneyToInput on Money? {
  Input toInput(CurrencyValidator validator) {
    String amount = "";

    if (this != null && this!.amount > Fixed.zero) {
      // This is to show an empty string in the input when the amount is zero. I
      // feel it looks better than to show a '0' directly.
      amount = this!.amount.minorUnits.toString();
    }

    return Input(validator, value: amount);
  }
}

extension IntToInput on int? {
  Input toInput(IntValidator validator) {
    String value = "";

    if (this != null && this! > 0) {
      // This is to show an empty string in the input when the amount is zero. I
      // feel it looks better than to show a '0' directly.
      value = toString();
    }

    return Input(validator, value: value);
  }
}

extension StringToInput on String {
  Input toInput(StringValidator validator) {
    return Input(validator, value: this);
  }
}
