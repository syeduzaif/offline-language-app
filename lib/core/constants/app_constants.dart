import 'package:flutter/material.dart';

const String kAppName = 'LinguaGo';
const String kDbFileName = 'linguago.db';
const String kDbEncryptionKeyAlias = 'linguago_db_key_v1';

const int kCardsPerLesson = 10;
const int kLessonsPerQuiz = 3;
const int kMasteredIntervalDays = 21;

class DailyGoalPreset {
  const DailyGoalPreset({required this.label, required this.minutes});
  final String label;
  final int minutes;
}

const List<DailyGoalPreset> kDailyGoalPresets = [
  DailyGoalPreset(label: 'Casual', minutes: 5),
  DailyGoalPreset(label: 'Regular', minutes: 10),
  DailyGoalPreset(label: 'Serious', minutes: 15),
  DailyGoalPreset(label: 'Intense', minutes: 20),
];

class SupportedLanguage {
  const SupportedLanguage({
    required this.code,
    required this.englishName,
    required this.nativeName,
    required this.flag,
  });
  final String code;
  final String englishName;
  final String nativeName;
  final String flag;
}

const List<SupportedLanguage> kSupportedLanguages = [
  SupportedLanguage(code: 'es', englishName: 'Spanish', nativeName: 'Español', flag: '🇪🇸'),
  SupportedLanguage(code: 'fr', englishName: 'French', nativeName: 'Français', flag: '🇫🇷'),
  SupportedLanguage(code: 'ja', englishName: 'Japanese', nativeName: '日本語', flag: '🇯🇵'),
  SupportedLanguage(code: 'ar', englishName: 'Arabic', nativeName: 'العربية', flag: '🇸🇦'),
  SupportedLanguage(code: 'hi', englishName: 'Hindi', nativeName: 'हिन्दी', flag: '🇮🇳'),
];

const Duration kCardFlipDuration = Duration(milliseconds: 350);
const Duration kCelebrationDuration = Duration(milliseconds: 2000);

const EdgeInsets kPagePadding = EdgeInsets.symmetric(horizontal: 20, vertical: 16);
const double kThumbReachableBottom = 120.0;
