import 'package:drift/drift.dart';

class CardProgress extends Table {
  TextColumn get phraseId => text()();
  TextColumn get languageCode => text()();
  RealColumn get easeFactor => real().withDefault(const Constant(2.5))();
  IntColumn get intervalDays => integer().withDefault(const Constant(0))();
  IntColumn get repetitions => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextDueAt => dateTime().nullable()();
  DateTimeColumn get lastReviewedAt => dateTime().nullable()();
  IntColumn get totalReviews => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {phraseId};
}
