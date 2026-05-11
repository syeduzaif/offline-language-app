import 'package:drift/drift.dart';

class UserPreferences extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get activeLanguageCode => text().nullable()();
  IntColumn get dailyGoalMinutes => integer().withDefault(const Constant(10))();
  TextColumn get themeMode => text().withDefault(const Constant('system'))();
  BoolColumn get notificationsEnabled => boolean().withDefault(const Constant(false))();
  DateTimeColumn get onboardedAt => dateTime().nullable()();
  DateTimeColumn get lastQuizAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
