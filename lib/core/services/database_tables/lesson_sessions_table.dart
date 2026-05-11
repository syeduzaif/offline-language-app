import 'package:drift/drift.dart';

class LessonSessions extends Table {
  TextColumn get id => text()();
  TextColumn get languageCode => text()();
  TextColumn get packId => text().nullable()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endedAt => dateTime().nullable()();
  IntColumn get cardsReviewed => integer().withDefault(const Constant(0))();
  IntColumn get durationSeconds => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
