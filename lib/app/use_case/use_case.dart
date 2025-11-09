import 'package:logger/web.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';

abstract class UseCase<I, O> {
  final logger = Logger(printer: UseCasePrinter());

  Future<O> exec(I input);
}
