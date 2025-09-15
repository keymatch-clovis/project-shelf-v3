import 'package:freezed_annotation/freezed_annotation.dart' show immutable;
import 'package:project_shelf_v3/adapter/common/custom_state_error.dart';
import 'package:project_shelf_v3/adapter/common/validator/object_validator.dart';

@immutable
class ObjectInput<T> {
  final ObjectValidator _validator;

  final T? value;
  final Set<CustomStateError> errors;

  ObjectInput(this._validator, {this.value, Set<CustomStateError>? errors})
    : errors = errors ?? {} {
    // Validate the input when it is created. This prevents invalid states, as
    // when the object input is invalid, but the validation has not been run.
    this.errors.addAll(_validator.validate(this.value));
  }

  ObjectInput<T> copyWith({T? value, Set<CustomStateError>? errors}) {
    final validationErrors = _validator.validate(value ?? this.value);
    validationErrors.addAll(errors ?? {});

    return ObjectInput(
      _validator,
      value: value ?? this.value,
      errors: validationErrors,
    );
  }
}
