import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/database.dart';

class StreakRepository {
  StreakRepository(this._db);
  final AppDatabase _db;

  Stream<Streak?> watch(String langCode) {
    return (_db.select(_db.streaks)..where((t) => t.languageCode.equals(langCode)))
        .watchSingleOrNull();
  }

  Future<void> registerActivity(String langCode) async {
    await _db.transaction(() async {
      final today = _dateOnly(DateTime.now());
      final current = await (_db.select(_db.streaks)
            ..where((t) => t.languageCode.equals(langCode)))
          .getSingleOrNull();
      final next = _computeNext(current, today, langCode);
      await _db.into(_db.streaks).insertOnConflictUpdate(next);
    });
  }

  StreaksCompanion _computeNext(Streak? current, DateTime today, String langCode) {
    final last = current?.lastActivityDate == null ? null : _dateOnly(current!.lastActivityDate!);
    final newCurrent = _streakValue(current?.currentStreak ?? 0, last, today);
    final longest = (current?.longestStreak ?? 0) < newCurrent
        ? newCurrent
        : (current?.longestStreak ?? 0);
    return StreaksCompanion(
      languageCode: Value(langCode),
      currentStreak: Value(newCurrent),
      longestStreak: Value(longest),
      lastActivityDate: Value(today),
      freezesAvailable: Value(current?.freezesAvailable ?? 0),
    );
  }

  int _streakValue(int prev, DateTime? last, DateTime today) {
    if (last == null) return 1;
    if (last == today) return prev == 0 ? 1 : prev;
    if (today.difference(last).inDays == 1) return prev + 1;
    return 1;
  }

  DateTime _dateOnly(DateTime t) => DateTime(t.year, t.month, t.day);
}

final streakRepositoryProvider = Provider<StreakRepository>((ref) {
  return StreakRepository(ref.watch(appDatabaseProvider));
});

final streakProvider = StreamProvider.family<Streak?, String>((ref, code) {
  return ref.watch(streakRepositoryProvider).watch(code);
});
