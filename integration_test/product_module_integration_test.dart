import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jiffy/jiffy.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/ui/screen/product/create_product_screen.dart';
import 'package:project_shelf_v3/injectable.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    configureDependencies(CustomEnvironment.integrationTest);

    await Jiffy.setLocale(PlatformDispatcher.instance.locale.languageCode);
  });

  testWidgets('Creates product', (tester) async {
    // Load widget
    await tester.pumpWidget(
      Localizations(
        locale: Locale('es'),
        delegates: AppLocalizations.localizationsDelegates,
        child: ProviderScope(child: CreateProductScreen()),
      ),
    );

    final nameTextField = find.byKey(const ValueKey('key'));

    print(nameTextField);

    // Trigger a frame
    await tester.pumpAndSettle();
  });
}
