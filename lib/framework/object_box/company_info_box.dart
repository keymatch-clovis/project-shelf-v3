import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/dto/object_box/company_info_dto.dart';
import 'package:project_shelf_v3/adapter/repository/company_info_repository.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/framework/object_box/object_box.dart';
import 'package:project_shelf_v3/main.dart';

final class CompanyInfoBox implements CompanyInfoRepository {
  final _logger = Logger(printer: FrameworkPrinter());

  final _objectBox = getIt.get<ObjectBox>();

  @override
  Future<Iterable<CompanyInfoDto>> get() async {
    _logger.d('Getting company info');
    return _objectBox.store.box<CompanyInfoDto>().getAllAsync();
  }
}
