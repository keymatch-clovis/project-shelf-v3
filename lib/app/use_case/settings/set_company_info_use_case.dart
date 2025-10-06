import 'package:logger/web.dart';
import 'package:project_shelf_v3/app/service/company_info_service.dart';
import 'package:project_shelf_v3/domain/entity/company_logo.dart';
import 'package:project_shelf_v3/domain/service/file_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/company_info.dart';
import 'package:project_shelf_v3/main.dart';

final class SetCompanyInfoUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CompanyInfoService>();
  final _fileService = getIt.get<FileService>();

  Future<void> exec({
    CompanyLogo? companyLogo,
    String? name,
    String? document,
    String? email,
    String? phone,
  }) async {
    if (companyLogo != null) {
      await _fileService.saveToFile(
        bytes: companyLogo.bytes,
        name: companyLogo.fileName!,
      );
    }

    final companyInfo = CompanyInfo(
      logo: companyLogo,
      name: name,
      document: document,
      email: email,
      phone: phone,
    );

    _logger.d('Setting company info');
    await _service.set(companyInfo);
  }
}
