import 'package:drift/drift.dart';

import '../constants/app_constants.dart';
import '../utils/logger.dart';
import 'database.dart';
import 'seed_content.dart';

class ContentSeeder {
  ContentSeeder(this._db);
  final AppDatabase _db;

  Future<void> seedIfEmpty() async {
    final existing = await _db.select(_db.languages).get();
    if (existing.isNotEmpty) return;
    await _db.transaction(() async {
      await _seedLanguages();
      await _seedPacksAndPhrases();
    });
    log.i('Seeded language content');
  }

  Future<void> _seedLanguages() async {
    for (final l in kSupportedLanguages) {
      await _db.into(_db.languages).insert(LanguagesCompanion.insert(
        code: l.code, englishName: l.englishName, nativeName: l.nativeName, flag: l.flag,
      ));
    }
  }

  Future<void> _seedPacksAndPhrases() async {
    for (final lang in kSupportedLanguages) {
      for (var i = 0; i < kPackSlugs.length; i++) {
        await _seedPack(lang.code, i);
      }
    }
  }

  Future<void> _seedPack(String langCode, int packIndex) async {
    final slug = kPackSlugs[packIndex];
    final packId = '${langCode}_$slug';
    await _db.into(_db.topicPacks).insert(TopicPacksCompanion.insert(
      id: packId,
      languageCode: langCode,
      slug: slug,
      name: kPackNames[packIndex],
      emoji: kPackEmojis[packIndex],
      displayOrder: Value(packIndex),
    ));
    await _seedPhrases(langCode: langCode, packId: packId, slug: slug);
  }

  Future<void> _seedPhrases({required String langCode, required String packId, required String slug}) async {
    final prompts = kPromptsByPack[slug]!;
    final translations = kTranslations[langCode]![slug]!;
    for (var i = 0; i < prompts.length; i++) {
      await _db.into(_db.phrases).insert(PhrasesCompanion.insert(
        id: '${packId}_$i',
        packId: packId,
        languageCode: langCode,
        nativePrompt: prompts[i],
        targetText: translations[i],
        displayOrder: Value(i),
      ));
    }
  }
}
