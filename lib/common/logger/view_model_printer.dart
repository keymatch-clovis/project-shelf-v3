import 'package:logger/logger.dart';

class ViewModelPrinter extends LogPrinter{
  @override
  List<String> log(LogEvent event) {
    return ['[🥑 VIEW-MODEL] ${event.message}'];
  }
}
