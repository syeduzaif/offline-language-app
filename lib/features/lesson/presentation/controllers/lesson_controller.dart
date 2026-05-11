import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/database.dart';
import '../../../packs/data/repositories/packs_repository.dart';
import '../../../progress/data/repositories/sessions_repository.dart';
import '../../../progress/data/repositories/streak_repository.dart';
import '../../data/repositories/active_lesson_repository.dart';
import '../../data/repositories/card_progress_repository.dart';
import '../../domain/srs.dart';

class LessonRunner {
  LessonRunner(this.ref, {required this.languageCode, this.packId});
  final WidgetRef ref;
  final String languageCode;
  final String? packId;

  late List<Phrase> cards;
  int _index = 0;
  bool _flipped = false;
  late String _sessionId;
  late DateTime _startedAt;

  int get index => _index;
  bool get flipped => _flipped;
  bool get isComplete => _index >= cards.length;
  Phrase? get current => isComplete ? null : cards[_index];
  int get total => cards.length;

  Future<void> start() async {
    final resumed = await _tryResume();
    if (resumed) return;
    await _startFresh();
  }

  Future<bool> _tryResume() async {
    final active = await ref.read(activeLessonRepositoryProvider).read();
    if (active == null) return false;
    if (active.languageCode != languageCode || active.packId != packId) return false;
    cards = await _hydrateCards(active);
    if (cards.isEmpty) return false;
    _index = active.currentIndex.clamp(0, cards.length);
    _sessionId = active.sessionId;
    _startedAt = active.startedAt;
    return true;
  }

  Future<List<Phrase>> _hydrateCards(ActiveLesson active) async {
    final repo = ref.read(activeLessonRepositoryProvider);
    final ids = repo.decodeIds(active.phraseIdsJson);
    final all = await ref.read(packsRepositoryProvider).watchPhrasesByLanguage(languageCode).first;
    final byId = {for (final p in all) p.id: p};
    return [for (final id in ids) if (byId[id] != null) byId[id]!];
  }

  Future<void> _startFresh() async {
    final packsRepo = ref.read(packsRepositoryProvider);
    cards = await _selectCards(packsRepo);
    _sessionId = await ref.read(sessionsRepositoryProvider).startSession(
          languageCode: languageCode, packId: packId,
        );
    _startedAt = DateTime.now();
    await _persist();
  }

  Future<List<Phrase>> _selectCards(PacksRepository repo) async {
    if (packId != null) {
      final all = await repo.phrasesInPack(packId!);
      return all.take(kCardsPerLesson).toList();
    }
    final all = await repo.watchPhrasesByLanguage(languageCode).first;
    all.shuffle();
    return all.take(kCardsPerLesson).toList();
  }

  void flip() => _flipped = true;

  Future<void> rate(CardRating rating) async {
    if (current == null) return;
    await ref.read(cardProgressRepositoryProvider).recordReview(
          phraseId: current!.id, languageCode: languageCode, rating: rating,
        );
    _index += 1;
    _flipped = false;
    if (isComplete) {
      await _finalize();
    } else {
      await _persist();
    }
  }

  Future<void> _persist() async {
    await ref.read(activeLessonRepositoryProvider).save(
      sessionId: _sessionId,
      languageCode: languageCode,
      packId: packId,
      phraseIds: cards.map((c) => c.id).toList(),
      currentIndex: _index,
      startedAt: _startedAt,
    );
  }

  Future<void> _finalize() async {
    final duration = DateTime.now().difference(_startedAt).inSeconds;
    await ref.read(sessionsRepositoryProvider).finishSession(
          id: _sessionId,
          cardsReviewed: cards.length,
          durationSeconds: duration,
        );
    await ref.read(streakRepositoryProvider).registerActivity(languageCode);
    await ref.read(activeLessonRepositoryProvider).clear();
  }
}
