import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/database.dart';
import '../../../home/presentation/controllers/home_state.dart';
import '../../../lesson/data/repositories/card_progress_repository.dart';
import '../../../packs/data/repositories/packs_repository.dart';
import '../../../quiz/presentation/pages/quiz_page.dart';
import '../../data/repositories/sessions_repository.dart';
import '../../data/repositories/streak_repository.dart';

class ProgressPage extends ConsumerWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(activeLanguageCodeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Progress')),
      body: code == null
          ? const Center(child: Text('Pick a language first'))
          : _ProgressBody(languageCode: code),
    );
  }
}

class _ProgressBody extends ConsumerWidget {
  const _ProgressBody({required this.languageCode});
  final String languageCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: kPagePadding,
      children: [
        _StreakHeatmap(languageCode: languageCode),
        const SizedBox(height: 24),
        _StatRow(languageCode: languageCode),
        const SizedBox(height: 24),
        _MasteryByPack(languageCode: languageCode),
        const SizedBox(height: 24),
        FilledButton.icon(
          icon: const Icon(Icons.quiz_outlined),
          label: const Text('Take a quiz'),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => QuizPage(languageCode: languageCode)),
          ),
        ),
      ],
    );
  }
}

class _StreakHeatmap extends ConsumerWidget {
  const _StreakHeatmap({required this.languageCode});
  final String languageCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessions = ref.watch(sessionsByLanguageProvider(languageCode)).value ?? const [];
    final activeDays = _activeDates(sessions);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Last 30 days', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            _HeatmapGrid(activeDays: activeDays),
          ],
        ),
      ),
    );
  }

  Set<DateTime> _activeDates(List<LessonSession> sessions) {
    return {
      for (final s in sessions) DateTime(s.startedAt.year, s.startedAt.month, s.startedAt.day),
    };
  }
}

class _HeatmapGrid extends StatelessWidget {
  const _HeatmapGrid({required this.activeDays});
  final Set<DateTime> activeDays;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final scheme = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: List.generate(30, (i) {
        final day = DateTime(today.year, today.month, today.day - (29 - i));
        final active = activeDays.contains(day);
        return Container(
          width: 24, height: 24,
          decoration: BoxDecoration(
            color: active ? scheme.primary : scheme.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class _StatRow extends ConsumerWidget {
  const _StatRow({required this.languageCode});
  final String languageCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streak = ref.watch(streakProvider(languageCode)).value;
    final progress = ref.watch(cardProgressByLanguageProvider(languageCode)).value ?? const [];
    final sessions = ref.watch(sessionsByLanguageProvider(languageCode)).value ?? const [];
    final totalMinutes = sessions.fold<int>(0, (sum, s) => sum + s.durationSeconds) ~/ 60;
    return Row(
      children: [
        Expanded(child: _StatTile(label: 'Streak', value: '${streak?.currentStreak ?? 0}')),
        const SizedBox(width: 12),
        Expanded(child: _StatTile(label: 'Words', value: '${progress.length}')),
        const SizedBox(width: 12),
        Expanded(child: _StatTile(label: 'Minutes', value: '$totalMinutes')),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Text(value, style: tt.headlineMedium),
            Text(label, style: tt.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _MasteryByPack extends ConsumerWidget {
  const _MasteryByPack({required this.languageCode});
  final String languageCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packs = ref.watch(packsForActiveLanguageProvider(languageCode)).value ?? const [];
    final progress = ref.watch(cardProgressByLanguageProvider(languageCode)).value ?? const [];
    final phrases = ref.watch(phrasesByLanguageProvider(languageCode)).value ?? const [];
    final phrasePackById = {for (final p in phrases) p.id: p.packId};
    final masteredByPack = _groupMastered(progress, phrasePackById);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mastery', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            for (final p in packs)
              _PackMasteryRow(pack: p, mastered: masteredByPack[p.id] ?? 0),
          ],
        ),
      ),
    );
  }

  Map<String, int> _groupMastered(List<CardProgressData> progress, Map<String, String> phrasePackById) {
    final out = <String, int>{};
    for (final c in progress) {
      if (c.intervalDays < kMasteredIntervalDays) continue;
      final packId = phrasePackById[c.phraseId];
      if (packId == null) continue;
      out[packId] = (out[packId] ?? 0) + 1;
    }
    return out;
  }
}

class _PackMasteryRow extends StatelessWidget {
  const _PackMasteryRow({required this.pack, required this.mastered});
  final TopicPack pack;
  final int mastered;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Text(pack.emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(child: Text(pack.name)),
          Text('$mastered mastered'),
        ],
      ),
    );
  }
}
