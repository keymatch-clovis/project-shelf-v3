import 'package:project_shelf_v3/adapter/view_model/common/validator/validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_error.dart';

class StringValidator implements Validator<String> {
  @override
  final bool isRequired;

  StringValidator({this.isRequired = false});

  @override
  List<ViewModelError> validate(String value) {
    List<ViewModelError> errors = [];

    if (isRequired) {
      if (value.isEmpty) {
        errors.add(ViewModelError.blankValue);
      }
    }

    return errors;
  }
}