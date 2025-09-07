import 'package:logger/logger.dart';

class UseCasePrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return ['[🧑‍💼 USE-CASE] ${event.message}'];
  }
}
