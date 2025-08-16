import 'package:project_shelf_v3/adapter/view_model/common/view_model_error.dart';

class Input {
  String value = "";
  List<ViewModelError> errors = [];

  Input.empty();
  Input({required this.value, required this.errors});
}
