import 'package:project_shelf_v3/adapter/view_model/common/view_model_error.dart';

List<ViewModelError> validateString(String value, {bool required = false}) {
  List<ViewModelError> errors = [];

  if (required) {
    if (value.isEmpty) {
      errors.add(ViewModelError.blankValue);
    }
  }

  return errors;
}
