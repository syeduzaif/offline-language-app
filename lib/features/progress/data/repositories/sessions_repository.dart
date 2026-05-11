import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/database.dart';

class SessionsRepository {
  SessionsRepository(this._db);
  final AppDatabase _db;

  Stream<List<LessonSession>> watchByLanguage(String code) {
    return (_db.select(_db.lessonSessions)
          ..where((t) => t.languageCode.equals(code))
          ..orderBy([(t) => OrderingTerm.desc(t.startedAt)]))
        .watch();
  }

  Future<String> startSession({required String languageCode, String? packId}) async {
    final id = 'sess_${DateTime.now().microsecondsSinceEpoch}';
    await _db.into(_db.lessonSessions).insert(LessonSessionsCompanion.insert(
      id: id,
      languageCode: languageCode,
      packId: Value(packId),
      startedAt: DateTime.now(),
    ));
    return id;
  }

  Future<void> finishSession({
    required String id,
    required int cardsReviewed,
    required int durationSeconds,
  }) async {
    await (_db.update(_db.lessonSessions)..where((t) => t.id.equals(id))).write(
      LessonSessionsCompanion(
        endedAt: Value(DateTime.now()),
        cardsReviewed: Value(cardsReviewed),
        durationSeconds: Value(durationSeconds),
      ),
    );
  }
}

final sessionsRepositoryProvider = Provider<SessionsRepository>((ref) {
  return SessionsRepository(ref.watch(appDatabaseProvider));
});

final sessionsByLanguageProvider =
    StreamProvider.family<List<LessonSession>, String>((ref, code) {
  return ref.watch(sessionsRepositoryProvider).watchByLanguage(code);
});
