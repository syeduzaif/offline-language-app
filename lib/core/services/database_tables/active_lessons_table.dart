import 'package:drift/drift.dart';

class ActiveLessons extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get sessionId => text()();
  TextColumn get languageCode => text()();
  TextColumn get packId => text().nullable()();
  TextColumn get phraseIdsJson => text()();
  IntColumn get currentIndex => integer().withDefault(const Constant(0))();
  DateTimeColumn get startedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
