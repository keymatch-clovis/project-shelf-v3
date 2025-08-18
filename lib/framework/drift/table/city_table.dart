import 'package:drift/drift.dart';
import 'package:project_shelf_v3/adapter/dto/database/city_dto.dart';

@UseRowClass(CityDto)
class CityTable extends Table {
  @override
  String get tableName => 'city';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get department => text()();
}
