import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../preferences/data/repositories/preferences_repository.dart';
import '../../../progress/data/repositories/sessions_repository.dart';
import '../../../progress/data/repositories/streak_repository.dart';

final activeLanguageCodeProvider = Provider<String?>((ref) {
  return ref.watch(preferencesStreamProvider).value?.activeLanguageCode;
});

final dailyGoalMinutesProvider = Provider<int>((ref) {
  return ref.watch(preferencesStreamProvider).value?.dailyGoalMinutes ?? 10;
});

final activeStreakProvider = Provider<int>((ref) {
  final code = ref.watch(activeLanguageCodeProvider);
  if (code == null) return 0;
  return ref.watch(streakProvider(code)).value?.currentStreak ?? 0;
});

final lessonsSinceLastQuizProvider = Provider<int>((ref) {
  final code = ref.watch(activeLanguageCodeProvider);
  if (code == null) return 0;
  final lastQuiz = ref.watch(preferencesStreamProvider).value?.lastQuizAt;
  final sessions = ref.watch(sessionsByLanguageProvider(code)).value ?? const [];
  return sessions.where((s) {
    if (s.endedAt == null) return false;
    if (lastQuiz == null) return true;
    return s.endedAt!.isAfter(lastQuiz);
  }).length;
});

final shouldSuggestQuizProvider = Provider<bool>((ref) {
  return ref.watch(lessonsSinceLastQuizProvider) >= kLessonsPerQuiz;
});

final todaysProgressProvider = Provider<double>((ref) {
  final code = ref.watch(activeLanguageCodeProvider);
  if (code == null) return 0;
  final goal = ref.watch(dailyGoalMinutesProvider);
  final sessions = ref.watch(sessionsByLanguageProvider(code)).value ?? [];
  final today = _today();
  final secondsToday = sessions
      .where((s) => _sameDay(s.startedAt, today))
      .fold<int>(0, (sum, s) => sum + s.durationSeconds);
  final ratio = secondsToday / (goal * 60);
  return ratio.clamp(0, 1).toDouble();
});

DateTime _today() {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day);
}

bool _sameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
