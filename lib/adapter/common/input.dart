import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/common/validator/validation_error.dart';
import 'package:project_shelf_v3/adapter/common/validator/validation_rule.dart';

@immutable
final class Input<T> {
  final Option<T> value;
  final Set<ValidationError> errors;
  final Set<ValidationRule> _validationRules;

  Input({
    this.value = const None(),
    Set<ValidationRule>? validationRules,
    Set<ValidationError>? errors,
  }) : errors = errors ?? {},
       _validationRules = validationRules ?? const {} {
    // Validate the input when it is created. This prevents invalid states, as
    // when the input is invalid, but the validation has not been run.
    final newErrors = _validationRules.fold(<ValidationError>{}, (acc, it) {
      final error = it.validate(value);
      if (error != null) {
        acc.add(error);
      }
      return acc;
    });

    this.errors.addAll(newErrors);
  }

  Input<T> copyWithoutValue({
    Set<ValidationRule>? validationRules,
    Set<ValidationError>? errors,
  }) {
    // If we set the validation rules, they must be added to the already
    // defined ones, or override them.
    var newRules = {..._validationRules};
    if (validationRules != null) {
      newRules.addAll(validationRules);
    }

    return Input(validationRules: newRules, errors: errors);
  }

  Input<T> copyWith({
    T? value,
    Set<ValidationRule>? validationRules,
    Set<ValidationError>? errors,
  }) {
    // If we set the validation rules, they must be added to the already
    // defined ones, or override them.
    var newRules = <ValidationRule>{};
    if (validationRules != null) {
      newRules.addAll(validationRules);
    }
    newRules.addAll(_validationRules);

    return Input(
      value: value != null ? Some(value) : this.value,
      validationRules: newRules,
      errors: errors,
    );
  }
}
