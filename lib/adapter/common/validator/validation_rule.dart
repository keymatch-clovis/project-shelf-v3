import 'package:project_shelf_v3/adapter/common/validator/validation_error.dart';

abstract class ValidationRule<T> {
  /// Name of the validation rule.
  ///
  /// This name **MUST** be unique, as we are using the validation rule names
  /// to check for equality.
  String get name;

  /// Default error of the validation rule.
  ValidationError get error;

  const ValidationRule();

  ValidationError? validate(T? value);

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is ValidationRule) {
      return name == other.name;
    }
    return false;
  }
}
