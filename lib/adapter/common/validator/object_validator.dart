import 'package:project_shelf_v3/adapter/common/custom_state_error.dart';
import 'package:project_shelf_v3/adapter/common/validator/validator.dart';

class ObjectValidator implements Validator<Object> {
  @override
  final bool isRequired;

  ObjectValidator({this.isRequired = false});

  @override
  Set<CustomStateError> validate(Object? value) {
    Set<CustomStateError> errors = Set.identity();

    if (isRequired) {
      if (value == null) {
        errors.add(CustomStateError.nullValue);
      }
    }

    return errors;
  }
}
