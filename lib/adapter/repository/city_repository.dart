import 'package:project_shelf_v3/adapter/dto/database/city_dto.dart';

final class CreateArgs {
  final String name;
  final String department;

  const CreateArgs({required this.name, required this.department});
}

abstract interface class CityRepository {
  /// CREATE related
  Future<void> createMany(Iterable<CreateArgs> items);

  /// READ related
  Stream<List<CityDto>> search(String value);

  /// DELETE related
  Future<void> deleteAll();
}
