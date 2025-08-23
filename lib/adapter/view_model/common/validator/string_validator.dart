import 'package:project_shelf_v3/adapter/view_model/common/validator/validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_error.dart';

class StringValidator implements Validator<String> {
  @override
  final bool isRequired;

  StringValidator({this.isRequired = false});

  @override
  Set<ViewModelError> validate(String value) {
    Set<ViewModelError> errors = Set.identity();

    if (isRequired) {
      if (value.isEmpty) {
        errors.add(ViewModelError.blankValue);
      }
    }

    return errors;
  }
}
