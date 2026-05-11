import 'package:drift/drift.dart';

class Streaks extends Table {
  TextColumn get languageCode => text()();
  IntColumn get currentStreak => integer().withDefault(const Constant(0))();
  IntColumn get longestStreak => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastActivityDate => dateTime().nullable()();
  IntColumn get freezesAvailable => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {languageCode};
}
