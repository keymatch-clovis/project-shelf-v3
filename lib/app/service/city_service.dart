import 'package:project_shelf_v3/app/entity/city.dart';

final class CreateArgs {
  final String name;
  final String department;

  const CreateArgs({required this.name, required this.department});
}

abstract interface class CityService {
  /// CREATE related
  Future<void> createMany(Iterable<CreateArgs> args);

  /// READ related
  Stream<List<City>> search(String value);

  /// DELETE related
  Future<void> deleteAll();
}
