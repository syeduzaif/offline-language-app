import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../lesson/presentation/pages/lesson_page.dart';
import '../../../packs/presentation/pages/pack_detail_page.dart';
import '../../../packs/data/repositories/packs_repository.dart';
import '../../../quiz/presentation/pages/quiz_page.dart';
import '../controllers/home_state.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text(kAppName)),
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              SizedBox(height: 16),
              _StreakHeader(),
              SizedBox(height: 24),
              _GoalRing(),
              SizedBox(height: 16),
              _QuizSuggestionBanner(),
              SizedBox(height: 16),
              _PackShortcuts(),
              Spacer(),
              _StartLessonButton(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _StreakHeader extends ConsumerWidget {
  const _StreakHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streak = ref.watch(activeStreakProvider);
    final tt = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('🔥', style: TextStyle(fontSize: 32)),
        const SizedBox(width: 8),
        Text('$streak day streak', style: tt.titleLarge),
      ],
    );
  }
}

class _GoalRing extends ConsumerWidget {
  const _GoalRing();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(todaysProgressProvider);
    final goal = ref.watch(dailyGoalMinutesProvider);
    return Center(
      child: SizedBox(
        height: 180,
        width: 180,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox.expand(
              child: CircularProgressIndicator(value: progress, strokeWidth: 12),
            ),
            _GoalRingLabel(progress: progress, goalMinutes: goal),
          ],
        ),
      ),
    );
  }
}

class _GoalRingLabel extends StatelessWidget {
  const _GoalRingLabel({required this.progress, required this.goalMinutes});
  final double progress;
  final int goalMinutes;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('${(progress * 100).round()}%', style: tt.headlineMedium),
        Text('of $goalMinutes min', style: tt.bodyMedium),
      ],
    );
  }
}

class _QuizSuggestionBanner extends ConsumerWidget {
  const _QuizSuggestionBanner();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shouldSuggest = ref.watch(shouldSuggestQuizProvider);
    final code = ref.watch(activeLanguageCodeProvider);
    if (!shouldSuggest || code == null) return const SizedBox.shrink();
    return Card(
      color: Theme.of(context).colorScheme.tertiaryContainer,
      child: ListTile(
        leading: const Icon(Icons.quiz_outlined),
        title: const Text('Time for a quiz!'),
        subtitle: const Text("You've finished 3 lessons. Test what stuck."),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => QuizPage(languageCode: code)),
        ),
      ),
    );
  }
}

class _PackShortcuts extends ConsumerWidget {
  const _PackShortcuts();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(activeLanguageCodeProvider);
    if (code == null) return const SizedBox();
    final packs = ref.watch(packsForActiveLanguageProvider(code));
    return SizedBox(
      height: 96,
      child: packs.when(
        data: (list) => ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          separatorBuilder: (_, _) => const SizedBox(width: 12),
          itemBuilder: (_, i) => _PackChip(pack: list[i]),
        ),
        loading: () => const SizedBox(),
        error: (_, _) => const SizedBox(),
      ),
    );
  }
}

class _PackChip extends StatelessWidget {
  const _PackChip({required this.pack});
  final dynamic pack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => PackDetailPage(packId: pack.id, packName: pack.name)),
      ),
      child: Container(
        width: 88,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pack.emoji as String, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 4),
            Text(pack.name as String, style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}

class _StartLessonButton extends ConsumerWidget {
  const _StartLessonButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(activeLanguageCodeProvider);
    return FilledButton(
      onPressed: code == null
          ? null
          : () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => LessonPage(languageCode: code)),
              ),
      child: const Text("Start Today's Lesson"),
    );
  }
}
