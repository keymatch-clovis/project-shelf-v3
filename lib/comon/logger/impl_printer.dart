
import 'package:logger/logger.dart';

class ImplPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return ['[⚙️ IMPL] ${event.message}'];
  }
}