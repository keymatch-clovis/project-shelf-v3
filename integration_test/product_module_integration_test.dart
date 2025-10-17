import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:jiffy/jiffy.dart';
import 'package:project_shelf_v3/framework/ui/common/keys.dart';
import 'package:project_shelf_v3/injectable.dart';
import 'package:project_shelf_v3/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    configureDependencies(CustomEnvironment.integrationTest);

    await Jiffy.setLocale(PlatformDispatcher.instance.locale.languageCode);
  });

  testWidgets('Creates product', (tester) async {
    // Load widget
    await tester.pumpWidget(ProviderScope(child: const MainApp()));

    // Trigger a frame to load localizations and other elements.
    await tester.pumpAndSettle();

    // Navigate to the create product screen.
    await tester.tap(find.byKey(UiKey.NAVIGATION_PRODUCTS));
    await tester.pumpAndSettle();

    final name = 'test';
    final defaultPrice = '1000';
    final purchasePrice = '1000';
    final stock = '10';

    final nameTextField = find.byKey(const ValueKey('name'));
    final defaultPriceTextField = find.byKey(const ValueKey('default_price'));
    final purchasePriceTextField = find.byKey(const ValueKey('purchase_price'));
    final stockTextField = find.byKey(const ValueKey('stock'));

    await tester.enterText(nameTextField, name);
    await tester.testTextInput.receiveAction(TextInputAction.next);
    await tester.pumpAndSettle();

    await tester.enterText(defaultPriceTextField, defaultPrice);
    await tester.testTextInput.receiveAction(TextInputAction.next);
    await tester.pumpAndSettle();

    await tester.enterText(purchasePriceTextField, purchasePrice);
    await tester.testTextInput.receiveAction(TextInputAction.next);
    await tester.pumpAndSettle();

    await tester.enterText(stockTextField, stock);
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();

    final saveButton = find.byKey(const ValueKey('save'));
    await tester.tap(saveButton);
    await tester.pumpAndSettle();
  });
}
