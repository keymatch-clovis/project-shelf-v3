import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';
import 'package:get_it/get_it.dart';
import 'package:project_shelf_v3/service_register.dart';

// https://pub.dev/packages/get_it#getit-in-detail
final GetIt getIt = GetIt.instance;

void main() async {
  //debugPaintSizeEnabled = true;

  // Almost all projects have this.
  WidgetsFlutterBinding.ensureInitialized();

  await Jiffy.setLocale(PlatformDispatcher.instance.locale.languageCode);

  final serviceRegister = ServiceRegister();

  // Register all services with [getIt]. We need to do this like this, so we
  // can test it later.
  await serviceRegister.registerAll();

  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.

    // TODO: override here the app info to get the version.
    ProviderScope(child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Project Shelf App',
      theme: ThemeData(useMaterial3: true),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: goRouter,
    );
  }
}
