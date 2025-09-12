import 'package:project_shelf_v3/adapter/common/custom_state_error.dart';
import 'package:project_shelf_v3/adapter/common/validator/validator.dart';

class StringValidator implements Validator<String> {
  @override
  final bool isRequired;

  StringValidator({this.isRequired = false});

  @override
  Set<CustomStateError> validate(String value) {
    Set<CustomStateError> errors = Set.identity();

    if (isRequired) {
      if (value.isEmpty) {
        errors.add(CustomStateError.blankValue);
      }
    }

    return errors;
  }
}
