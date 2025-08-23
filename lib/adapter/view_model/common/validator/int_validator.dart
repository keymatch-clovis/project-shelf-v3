import 'package:project_shelf_v3/adapter/view_model/common/validator/validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_error.dart';

class IntValidator implements Validator<String> {
  @override
  final bool isRequired;

  IntValidator({this.isRequired = false});

  @override
  Set<ViewModelError> validate(String value) {
    Set<ViewModelError> errors = Set.identity();
    num? transformed = num.tryParse(value);

    if (isRequired) {
      if (value.isEmpty) {
        errors.add(ViewModelError.blankValue);
      }

      if (transformed == null) {
        errors.add(ViewModelError.invalidIntegerValue);
      }
    }
    // If the this is not null, we have to check the inside of the string, to see
    // if it is what we expect.
    else if (value.isNotEmpty && transformed == null) {
      errors.add(ViewModelError.invalidIntegerValue);
    }

    return errors;
  }
}
