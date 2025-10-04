import 'package:logger/web.dart';
import 'package:project_shelf_v3/app/common/constants.dart';
import 'package:project_shelf_v3/app/dto/company_info_response.dart';
import 'package:project_shelf_v3/app/service/company_info_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/main.dart';

final class GetCompanyInfoUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CompanyInfoService>();

  Future<CompanyInfoResponse> exec() async {
    _logger.d('Getting company info');
    return _service
        .getCompanyInfo()
        .then((it) {
          assert(it.length <= 1);
          return it.singleOrNull;
        })
        .then((it) async {
          // If no company info was provided, we can show a default one.
          //
          // NOTE: If we had to have some default data or something like that,
          // we would need to create a new object, and then return that one.
          // Luckily, we do not need that yet.
          if (it == null) {
            return CompanyInfoResponse(logoFileName: DEFAULT_LOGO_FILE_NAME);
          }

          // If no logo file name was defined, we have to always assign the
          // default logo file name.
          if (it.logoFileName == null) {
            return it.copyWith(logoFileName: DEFAULT_LOGO_FILE_NAME);
          }
          return it;
        });
  }
}
