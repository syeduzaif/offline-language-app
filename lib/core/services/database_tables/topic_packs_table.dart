import 'package:drift/drift.dart';

class TopicPacks extends Table {
  TextColumn get id => text()();
  TextColumn get languageCode => text()();
  TextColumn get slug => text()();
  TextColumn get name => text()();
  TextColumn get emoji => text()();
  IntColumn get displayOrder => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
