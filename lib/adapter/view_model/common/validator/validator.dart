import 'package:project_shelf_v3/adapter/view_model/common/view_model_error.dart';

abstract interface class Validator<T> {
  final bool isRequired = false;

  Set<ViewModelError> validate(T value);
}