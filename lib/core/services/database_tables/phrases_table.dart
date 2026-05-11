import 'package:drift/drift.dart';

class Phrases extends Table {
  TextColumn get id => text()();
  TextColumn get packId => text()();
  TextColumn get languageCode => text()();
  TextColumn get nativePrompt => text()();
  TextColumn get targetText => text()();
  TextColumn get pronunciation => text().nullable()();
  TextColumn get audioPath => text().nullable()();
  IntColumn get displayOrder => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}
