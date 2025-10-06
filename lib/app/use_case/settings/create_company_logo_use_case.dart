import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/company_logo.dart';
import 'package:project_shelf_v3/domain/service/image_service.dart';
import 'package:project_shelf_v3/main.dart';

final class CreateCompanyLogoUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  final _imageService = getIt.get<ImageService>();

  /// Adjusts the image to follow the business rules for the app logo used in
  /// the invoices.
  Future<CompanyLogo> exec(Uint8List imageBytes) async {
    _logger.d('Adjusting image to logo standards');
    return CompanyLogo.fromRawImage(
      imageService: _imageService,
      bytes: imageBytes,
    );
  }
}
