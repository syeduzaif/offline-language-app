import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/database.dart';

class ActiveLessonRepository {
  ActiveLessonRepository(this._db);
  final AppDatabase _db;

  Stream<ActiveLesson?> watch() =>
      (_db.select(_db.activeLessons)..where((t) => t.id.equals(1)))
          .watchSingleOrNull();

  Future<ActiveLesson?> read() =>
      (_db.select(_db.activeLessons)..where((t) => t.id.equals(1)))
          .getSingleOrNull();

  Future<void> save({
    required String sessionId,
    required String languageCode,
    String? packId,
    required List<String> phraseIds,
    required int currentIndex,
    required DateTime startedAt,
  }) async {
    await _db.into(_db.activeLessons).insertOnConflictUpdate(
      ActiveLessonsCompanion(
        id: const Value(1),
        sessionId: Value(sessionId),
        languageCode: Value(languageCode),
        packId: Value(packId),
        phraseIdsJson: Value(jsonEncode(phraseIds)),
        currentIndex: Value(currentIndex),
        startedAt: Value(startedAt),
      ),
    );
  }

  Future<void> clear() async {
    await (_db.delete(_db.activeLessons)..where((t) => t.id.equals(1))).go();
  }

  List<String> decodeIds(String json) =>
      (jsonDecode(json) as List).cast<String>();
}

final activeLessonRepositoryProvider = Provider<ActiveLessonRepository>((ref) {
  return ActiveLessonRepository(ref.watch(appDatabaseProvider));
});

final activeLessonProvider = StreamProvider<ActiveLesson?>((ref) {
  return ref.watch(activeLessonRepositoryProvider).watch();
});
