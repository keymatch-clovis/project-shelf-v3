import 'package:project_shelf_v3/adapter/common/custom_state_error.dart';
import 'package:project_shelf_v3/adapter/common/validator/validator.dart';

final class DateTimeValidator implements Validator<DateTime> {
  @override
  final bool isRequired;

  const DateTimeValidator({this.isRequired = false});

  @override
  Set<CustomStateError> validate(DateTime? value) {
    Set<CustomStateError> errors = const {};

    if (isRequired) {
      if (value == null) {
        errors.add(CustomStateError.nullValue);
      }
    }

    return errors;
  }
}
