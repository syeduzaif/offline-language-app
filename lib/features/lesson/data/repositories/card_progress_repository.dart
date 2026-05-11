import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/database.dart';
import '../../domain/srs.dart';

class CardProgressRepository {
  CardProgressRepository(this._db);
  final AppDatabase _db;

  Future<CardProgressData?> findByPhrase(String phraseId) {
    return (_db.select(_db.cardProgress)..where((t) => t.phraseId.equals(phraseId)))
        .getSingleOrNull();
  }

  Stream<List<CardProgressData>> watchAllForLanguage(String langCode) {
    return (_db.select(_db.cardProgress)..where((t) => t.languageCode.equals(langCode))).watch();
  }

  Future<void> recordReview({
    required String phraseId,
    required String languageCode,
    required CardRating rating,
  }) async {
    await _db.transaction(() async {
      final current = await findByPhrase(phraseId);
      final next = SrsAlgorithm.review(
        rating: rating,
        repetitions: current?.repetitions ?? 0,
        intervalDays: current?.intervalDays ?? 0,
        easeFactor: current?.easeFactor ?? 2.5,
      );
      await _db.into(_db.cardProgress).insertOnConflictUpdate(_buildRow(
        phraseId: phraseId, languageCode: languageCode,
        next: next, totalReviews: (current?.totalReviews ?? 0) + 1,
      ));
    });
  }

  CardProgressCompanion _buildRow({
    required String phraseId,
    required String languageCode,
    required SrsState next,
    required int totalReviews,
  }) {
    return CardProgressCompanion(
      phraseId: Value(phraseId),
      languageCode: Value(languageCode),
      easeFactor: Value(next.easeFactor),
      intervalDays: Value(next.intervalDays),
      repetitions: Value(next.repetitions),
      nextDueAt: Value(next.nextDueAt),
      lastReviewedAt: Value(DateTime.now()),
      totalReviews: Value(totalReviews),
    );
  }

  Future<void> resetForLanguage(String langCode) async {
    await _db.transaction(() async {
      await (_db.delete(_db.cardProgress)..where((t) => t.languageCode.equals(langCode))).go();
      await (_db.delete(_db.lessonSessions)..where((t) => t.languageCode.equals(langCode))).go();
      await (_db.delete(_db.streaks)..where((t) => t.languageCode.equals(langCode))).go();
    });
  }
}

final cardProgressRepositoryProvider = Provider<CardProgressRepository>((ref) {
  return CardProgressRepository(ref.watch(appDatabaseProvider));
});

final cardProgressByLanguageProvider =
    StreamProvider.family<List<CardProgressData>, String>((ref, code) {
  return ref.watch(cardProgressRepositoryProvider).watchAllForLanguage(code);
});
