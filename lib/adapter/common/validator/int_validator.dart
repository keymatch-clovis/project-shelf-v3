import 'package:project_shelf_v3/adapter/common/custom_state_error.dart';
import 'package:project_shelf_v3/adapter/common/validator/validator.dart';

class IntValidator implements Validator<String> {
  @override
  final bool isRequired;

  IntValidator({this.isRequired = false});

  @override
  Set<CustomStateError> validate(String value) {
    Set<CustomStateError> errors = Set.identity();
    num? transformed = num.tryParse(value);

    if (isRequired) {
      if (value.isEmpty) {
        errors.add(CustomStateError.blankValue);
      }

      if (transformed == null) {
        errors.add(CustomStateError.invalidIntegerValue);
      }
    }
    // If the this is not null, we have to check the inside of the string, to see
    // if it is what we expect.
    else if (value.isNotEmpty && transformed == null) {
      errors.add(CustomStateError.invalidIntegerValue);
    }

    return errors;
  }
}
