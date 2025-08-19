import 'package:logger/logger.dart';

class FrameworkPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return ['[🌭 FRAMEWORK] ${event.message}'];
  }
}
