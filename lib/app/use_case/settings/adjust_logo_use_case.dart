import 'dart:typed_data';

import 'package:logger/logger.dart';
import 'package:project_shelf_v3/common/logger/use_case_printer.dart';
import 'package:project_shelf_v3/domain/entity/company_info.dart';

final class AdjustLogoUseCase {
  final _logger = Logger(printer: UseCasePrinter());

  /// Adjusts the image to follow the business rules for the app logo used in
  /// the invoices.
  Future<Uint8List> exec(Uint8List imageBytes) async {
    _logger.d('Adjusting image to logo standards');
    // As the logic for the image manipulation is inside the entity, we need to
    // create a temporal entity for this.
    //
    // NOTE: We could change the entity to be more of an aggregate. That way
    // we could extract this method. But for now I think this is fine.
    return await CompanyInfo.create(logoBytes: imageBytes).then((it) {
      return it.logoBytes!;
    });
  }
}
