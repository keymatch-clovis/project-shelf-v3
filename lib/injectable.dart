import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injectable.config.dart';

// https://pub.dev/packages/get_it#getit-in-detail
// https://pub.dev/packages/injectable
final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies(String env) => getIt.init(
  environmentFilter: SimpleEnvironmentFilter(
    filter: (envs) {
      if (envs.isNotEmpty) {
        return envs.contains(env);
      }
      return true;
    },
  ),
);
