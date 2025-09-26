import 'package:project_shelf_v3/adapter/common/validator/validation_error.dart';
import 'package:project_shelf_v3/adapter/common/validator/validation_rule.dart';

final class IsIntegerRule extends ValidationRule<String> {
  @override
  String get name => "IS_INTEGER_RULE";

  @override
  ValidationError get error => ValidationError.INVALID_INTEGER_VALUE;

  @override
  ValidationError? validate(String? value) {
    if (value != null) {
      if (int.tryParse(value) == null) {
        return error;
      }
    }
    return null;
  }
}
