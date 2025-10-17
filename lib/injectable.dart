import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable.config.dart';

// https://pub.dev/packages/get_it#getit-in-detail
// https://pub.dev/packages/injectable
final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String env) async => await getIt.init(
  environmentFilter: SimpleEnvironmentFilter(
    filter: (envs) {
      // If the dependency has no environment registered, it means it can be
      // used anywhere.
      if (envs.isEmpty) {
        return true;
      }

      return envs.contains(env);
    },
  ),
);

// NOTE: This thing about registering order made me realize the problems that
// dependency injection has. Still I don't really know another way of doing
// this.
// https://pub.dev/packages/injectable#manual-order
abstract class RegisterOrder {
  static const BASE = -200;

  static const REPOSITORY = -100;

  // FIXME: These are not correct, and I'm trying to actively remove. This made
  //  me realize how services can't depend on other services, as these problems
  //  might arise.
  static const DEPENDANT_SERVICE = -51;
  static const SERVICE = -50;

  static const USE_CASE = 0;
}

abstract class CustomEnvironment {
  static const String integrationTest = 'integration_test';
}
