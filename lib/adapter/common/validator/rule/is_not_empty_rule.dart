import 'package:project_shelf_v3/adapter/common/validator/validation_error.dart';
import 'package:project_shelf_v3/adapter/common/validator/validation_rule.dart';

final class IsNotEmptyRule extends ValidationRule<String> {
  @override
  String get name => "NOT_EMPTY_RULE";

  @override
  ValidationError get error => ValidationError.BLANK_VALUE;

  @override
  ValidationError? validate(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return error;
      }
    }
    return null;
  }
}
