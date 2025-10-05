import 'dart:typed_data';

import 'package:logger/web.dart';
import 'package:project_shelf_v3/app/common/constants.dart';
import 'package:project_shelf_v3/app/service/company_info_service.dart';
import 'package:project_shelf_v3/app/service/file_service.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/company_info.dart';
import 'package:project_shelf_v3/main.dart';

final class SetCompanyInfoUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _service = getIt.get<CompanyInfoService>();
  final _fileService = getIt.get<FileService>();

  Future<void> exec({
    Uint8List? logoBytes,
    String? name,
    String? document,
    String? email,
    String? phone,
  }) async {
    // TODO: We are doing the logo adjusting step twice! This is because I'm a
    //  dumbass and I forget how Clean Architecture works---the adjusting step
    //  is on the framework layer, not the entity or app layer. We need to fix
    //  that.

    final companyInfo = await CompanyInfo.create(
      logoBytes: logoBytes,
      name: name,
      document: document,
      email: email,
      phone: phone,
    );

    if (companyInfo.logoBytes != null) {
      await _fileService.saveToFile(
        bytes: companyInfo.logoBytes!,
        name: DEFAULT_LOGO_FILE_NAME,
      );
    }

    _logger.d('Setting company info');
    await _service.setCompanyInfo(companyInfo);
  }
}
