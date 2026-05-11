import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/database.dart';

class PacksRepository {
  PacksRepository(this._db);
  final AppDatabase _db;

  Stream<List<TopicPack>> watchByLanguage(String code) {
    return (_db.select(_db.topicPacks)
          ..where((t) => t.languageCode.equals(code))
          ..orderBy([(t) => OrderingTerm.asc(t.displayOrder)]))
        .watch();
  }

  Future<List<Phrase>> phrasesInPack(String packId) {
    return (_db.select(_db.phrases)
          ..where((t) => t.packId.equals(packId))
          ..orderBy([(t) => OrderingTerm.asc(t.displayOrder)]))
        .get();
  }

  Stream<List<Phrase>> watchPhrasesByLanguage(String code) {
    return (_db.select(_db.phrases)..where((t) => t.languageCode.equals(code))).watch();
  }
}

final packsRepositoryProvider = Provider<PacksRepository>((ref) {
  return PacksRepository(ref.watch(appDatabaseProvider));
});

final packsForActiveLanguageProvider =
    StreamProvider.family<List<TopicPack>, String>((ref, langCode) {
  return ref.watch(packsRepositoryProvider).watchByLanguage(langCode);
});

final phrasesByLanguageProvider =
    StreamProvider.family<List<Phrase>, String>((ref, langCode) {
  return ref.watch(packsRepositoryProvider).watchPhrasesByLanguage(langCode);
});
