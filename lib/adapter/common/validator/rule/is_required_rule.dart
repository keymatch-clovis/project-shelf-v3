import 'package:project_shelf_v3/adapter/common/validator/validation_error.dart';
import 'package:project_shelf_v3/adapter/common/validator/validation_rule.dart';

final class IsRequiredRule extends ValidationRule {
  @override
  String get name => "IS_REQUIRED_RULE";

  @override
  ValidationError get error => ValidationError.NULL_VALUE;

  @override
  ValidationError? validate(value) {
    return value == null ? error : null;
  }
}
