import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/view_model/common/validator/validator.dart';
import 'package:project_shelf_v3/adapter/view_model/common/view_model_error.dart';

@immutable
class Input {
  final Validator<String> _validator;

  final String value;
  final Set<ViewModelError> errors;

  Input(this._validator, {String? value, Set<ViewModelError>? errors})
    : errors = errors ?? {},
      value = value ?? "";

  Input copyWith({String? value, Set<ViewModelError>? errors}) {
    final errors = _validator.validate(value ?? "");
    errors.addAll(errors);

    return Input(_validator, value: value ?? this.value, errors: errors);
  }
}
