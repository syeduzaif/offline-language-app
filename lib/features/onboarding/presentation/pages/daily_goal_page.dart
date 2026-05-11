import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../preferences/data/repositories/preferences_repository.dart';

class DailyGoalPage extends ConsumerWidget {
  const DailyGoalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily goal')),
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: ListView.separated(
            itemCount: kDailyGoalPresets.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (_, i) => _GoalCard(
              preset: kDailyGoalPresets[i],
              onTap: () => _select(context, ref, kDailyGoalPresets[i].minutes),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _select(BuildContext context, WidgetRef ref, int minutes) async {
    final repo = ref.read(preferencesRepositoryProvider);
    await repo.setDailyGoal(minutes);
    await repo.markOnboarded();
    if (!context.mounted) return;
    Navigator.of(context).popUntil((r) => r.isFirst);
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({required this.preset, required this.onTap});
  final DailyGoalPreset preset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(preset.label, style: tt.titleLarge),
                    Text('${preset.minutes} minutes per day', style: tt.bodyMedium),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
