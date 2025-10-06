import 'dart:ui';

import 'package:project_shelf_v3/app/service/string_service.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

final class StringServiceImpl implements StringService {
  @override
  Future<String> getInvoiceDocument(String locale, {required String document}) {
    return AppLocalizations.delegate.load(Locale(locale)).then((it) {
      // NOTE: If we need to support various formats of company documents, we
      // would have to do that here.
      return it.nit_document(document);
    });
  }
}
