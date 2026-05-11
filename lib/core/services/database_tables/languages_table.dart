import 'package:drift/drift.dart';

class Languages extends Table {
  TextColumn get code => text()();
  TextColumn get englishName => text()();
  TextColumn get nativeName => text()();
  TextColumn get flag => text()();

  @override
  Set<Column> get primaryKey => {code};
}
