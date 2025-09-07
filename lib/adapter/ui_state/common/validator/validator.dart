import 'package:project_shelf_v3/adapter/ui_state/common/custom_state_error.dart';

abstract interface class Validator<T> {
  final bool isRequired = false;

  Set<CustomStateError> validate(T value);
}
