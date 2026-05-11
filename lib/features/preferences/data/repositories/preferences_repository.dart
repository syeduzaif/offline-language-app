import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/database.dart';

class PreferencesRepository {
  PreferencesRepository(this._db);
  final AppDatabase _db;

  Stream<UserPreference?> watch() =>
      (_db.select(_db.userPreferences)..where((t) => t.id.equals(1)))
          .watchSingleOrNull();

  Future<UserPreference?> read() =>
      (_db.select(_db.userPreferences)..where((t) => t.id.equals(1)))
          .getSingleOrNull();

  Future<void> setLanguage(String code) => _upsert(activeLanguageCode: Value(code));
  Future<void> setDailyGoal(int minutes) => _upsert(dailyGoalMinutes: Value(minutes));
  Future<void> setThemeMode(String mode) => _upsert(themeMode: Value(mode));
  Future<void> markOnboarded() => _upsert(onboardedAt: Value(DateTime.now()));
  Future<void> markQuizTaken() => _upsert(lastQuizAt: Value(DateTime.now()));

  Future<void> _upsert({
    Value<String?> activeLanguageCode = const Value.absent(),
    Value<int> dailyGoalMinutes = const Value.absent(),
    Value<String> themeMode = const Value.absent(),
    Value<DateTime?> onboardedAt = const Value.absent(),
    Value<DateTime?> lastQuizAt = const Value.absent(),
  }) async {
    await _db.into(_db.userPreferences).insertOnConflictUpdate(
      UserPreferencesCompanion(
        id: const Value(1),
        activeLanguageCode: activeLanguageCode,
        dailyGoalMinutes: dailyGoalMinutes,
        themeMode: themeMode,
        onboardedAt: onboardedAt,
        lastQuizAt: lastQuizAt,
      ),
    );
  }
}

final preferencesRepositoryProvider = Provider<PreferencesRepository>((ref) {
  return PreferencesRepository(ref.watch(appDatabaseProvider));
});

final preferencesStreamProvider = StreamProvider<UserPreference?>((ref) {
  return ref.watch(preferencesRepositoryProvider).watch();
});
