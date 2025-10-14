import 'dart:ui';

import 'package:project_shelf_v3/app/service/string_service.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

final class StringServiceImpl implements StringService {
  final AppLocalizations _localizations;

  const StringServiceImpl._(this._localizations);

  static Future<StringServiceImpl> create(String locale) async {
    final localizations = await AppLocalizations.delegate.load(Locale(locale));
    return StringServiceImpl._(localizations);
  }

  @override
  String getInvoiceDocumentString(String document) {
    // NOTE: If we need to support various formats of company documents, we
    // would have to do that here.
    return _localizations.nit_document(document);
  }

  @override
  String getShelfString(ShelfString shelfString) {
    return switch (shelfString) {
      ShelfString.PRODUCT => _localizations.product,
      ShelfString.UNIT_ABBREVIATED => _localizations.unit_abbreviated,
      ShelfString.VALUE => _localizations.value,
      ShelfString.TOTAL => _localizations.total,
      ShelfString.REMAINING_UNPAID_BALANCE =>
        _localizations.remaining_unpaid_balance,
    };
  }
}
