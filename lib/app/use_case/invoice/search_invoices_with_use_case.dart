import 'package:project_shelf_v3/app/dto/invoice_response.dart';
import 'package:project_shelf_v3/app/service/app_preferences_service.dart';
import 'package:project_shelf_v3/app/service/invoice_service.dart';
import 'package:project_shelf_v3/common/typedefs.dart';
import 'package:project_shelf_v3/injectable.dart';

final class SearchInvoicesWithUseCase {
  final _service = getIt.get<InvoiceService>();
  final _appPreferencesService = getIt.get<AppPreferencesService>();

  Future<Iterable<InvoiceResponse>> exec({Id? customerId}) async {
    final defaultCurrency = await _appPreferencesService
        .getAppPreferences()
        .then((it) => it.defaultCurrency);

    if (customerId != null) {
      return _service.searchWith(
        customerId: customerId,
        currency: defaultCurrency,
      );
    }
    throw AssertionError('Tried to search invoice without query.');
  }
}
