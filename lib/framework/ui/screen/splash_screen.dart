import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:project_shelf_v3/framework/riverpod/splash_screen_provider.dart';
import 'package:project_shelf_v3/framework/ui/routing/router.dart';

final class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

final class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(splashScreenProvider.notifier).loadDefaultData();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(splashScreenProvider.selectAsync((it) => it.loadingStatus), (
      _,
      status,
    ) async {
      switch (await status) {
        case SplashScreenLoadingStatus.DONE:
          context.go(CustomRoute.PRODUCT.route);
        default:
        // Do nothing :p
      }
    });

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Column(
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 8),
                  Text("tester"),
                ],
              ),
              Spacer(),
              Text("version"),
            ],
          ),
        ),
      ),
    );
  }
}
