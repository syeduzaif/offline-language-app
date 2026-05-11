import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/database.dart';
import '../remote/translation_api.dart';

class LookupRepository {
  LookupRepository({required AppDatabase db, required TranslationApi api})
      : _db = db,
        _api = api;

  final AppDatabase _db;
  final TranslationApi _api;

  Future<Phrase> lookupAndSave({
    required String englishText,
    required String targetLangCode,
  }) async {
    final cached = await _findCached(englishText, targetLangCode);
    if (cached != null) return cached;
    final dto = await _api.translate(text: englishText, targetLangCode: targetLangCode);
    return _persist(englishText, targetLangCode, dto.responseData.translatedText);
  }

  Future<Phrase?> _findCached(String prompt, String langCode) async {
    final packId = _customPackId(langCode);
    final rows = await (_db.select(_db.phrases)
          ..where((t) => t.packId.equals(packId) & t.nativePrompt.equals(prompt))
          ..limit(1))
        .get();
    return rows.isEmpty ? null : rows.first;
  }

  Future<Phrase> _persist(String prompt, String langCode, String translated) async {
    return _db.transaction(() async {
      await _ensureCustomPack(langCode);
      return _insertPhrase(prompt, langCode, translated);
    });
  }

  Future<void> _ensureCustomPack(String langCode) async {
    final id = _customPackId(langCode);
    final exists = await (_db.select(_db.topicPacks)..where((t) => t.id.equals(id))).getSingleOrNull();
    if (exists != null) return;
    await _db.into(_db.topicPacks).insert(TopicPacksCompanion.insert(
      id: id, languageCode: langCode, slug: 'custom',
      name: 'Custom', emoji: '✨', displayOrder: const Value(99),
    ));
  }

  Future<Phrase> _insertPhrase(String prompt, String langCode, String translated) async {
    final id = '${_customPackId(langCode)}_${DateTime.now().microsecondsSinceEpoch}';
    final companion = PhrasesCompanion.insert(
      id: id, packId: _customPackId(langCode), languageCode: langCode,
      nativePrompt: prompt, targetText: translated, displayOrder: const Value(0),
    );
    await _db.into(_db.phrases).insert(companion);
    return (_db.select(_db.phrases)..where((t) => t.id.equals(id))).getSingle();
  }

  String _customPackId(String langCode) => '${langCode}_custom';
}

final lookupRepositoryProvider = Provider<LookupRepository>((ref) {
  return LookupRepository(
    db: ref.watch(appDatabaseProvider),
    api: ref.watch(translationApiProvider),
  );
});
