import 'package:project_shelf_v3/adapter/common/validator/validation_error.dart';
import 'package:project_shelf_v3/adapter/common/validator/validation_rule.dart';

final class IsMaximumRule extends ValidationRule<String> {
  @override
  String get name => "IS_MAXIMUM_RULE";

  final int maxValue;

  @override
  final ValidationError error;

  const IsMaximumRule(
    this.maxValue, {
    this.error = ValidationError.VALUE_TOO_BIG,
  });

  @override
  ValidationError? validate(String? value) {
    final transformed = int.tryParse(value ?? "");
    if (transformed != null) {
      if (transformed > maxValue) {
        return error;
      }
    }
    return null;
  }
}
