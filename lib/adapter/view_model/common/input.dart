import 'package:project_shelf_v3/adapter/view_model/common/validator/validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_error.dart';

class Input {
  final Validator<String> _validator;

  String value = "";
  List<ViewModelError> errors = [];

  Input(this._validator, {this.value = ""})
    : errors = _validator.validate(value);

  Input update(String value) {
    this.value = value;
    errors = _validator.validate(value);

    return this;
  }
}
