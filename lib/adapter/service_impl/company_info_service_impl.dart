import 'package:logger/web.dart';
import 'package:project_shelf_v3/adapter/repository/company_info_repository.dart';
import 'package:project_shelf_v3/app/dto/company_info_response.dart';
import 'package:project_shelf_v3/app/service/company_info_service.dart';
import 'package:project_shelf_v3/common/logger/impl_printer.dart';
import 'package:project_shelf_v3/main.dart';

final class CompanyInfoServiceImpl implements CompanyInfoService {
  final _logger = Logger(printer: ImplPrinter());

  final _service = getIt.get<CompanyInfoRepository>();

  @override
  Future<Iterable<CompanyInfoResponse>> getCompanyInfo() {
    _logger.d('Getting company info');
    return _service.get().then((it) {
      return it.map((it) {
        return CompanyInfoResponse(
          id: it.id,
          logoFileName: it.logoUri,
          name: it.name,
          document: it.document,
          email: it.email,
          phone: it.phone,
        );
      });
    });
  }
}
