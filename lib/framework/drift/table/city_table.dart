import 'package:drift/drift.dart';

class CityTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get department => text()();
}
