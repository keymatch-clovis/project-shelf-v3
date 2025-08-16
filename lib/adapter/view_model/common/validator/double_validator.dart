import 'package:project_shelf_v3/adapter/view_model/common/view_model_error.dart';

List<ViewModelError> validateDouble(String value, {bool required = false}) {
  List<ViewModelError> errors = [];
  double? transformed = double.tryParse(value);

  if (required) {
    if (value.isEmpty) {
      errors.add(ViewModelError.blankValue);
    }

    if (transformed == null) {
      errors.add(ViewModelError.invalidDecimalValue);
    }
  }
  // If the this is not null, we have to check the inside of the string, to see
  // if it is what we expect.
  else if (value.isNotEmpty && transformed == null) {
    errors.add(ViewModelError.invalidDecimalValue);
  }

  return errors;
}
