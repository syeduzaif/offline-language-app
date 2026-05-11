import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../home/presentation/controllers/home_state.dart';
import '../../../lesson/data/repositories/card_progress_repository.dart';
import '../../../preferences/data/repositories/preferences_repository.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: kPagePadding,
        children: const [
          _LanguageSection(),
          SizedBox(height: 24),
          _GoalSection(),
          SizedBox(height: 24),
          _ThemeSection(),
          SizedBox(height: 24),
          _ResetSection(),
        ],
      ),
    );
  }
}

class _LanguageSection extends ConsumerWidget {
  const _LanguageSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final code = ref.watch(activeLanguageCodeProvider);
    return Card(
      child: RadioGroup<String>(
        groupValue: code,
        onChanged: (v) {
          if (v != null) ref.read(preferencesRepositoryProvider).setLanguage(v);
        },
        child: Column(
          children: [
            for (final l in kSupportedLanguages)
              RadioListTile<String>(
                title: Text('${l.flag}  ${l.englishName}'),
                subtitle: Text(l.nativeName),
                value: l.code,
              ),
          ],
        ),
      ),
    );
  }
}

class _GoalSection extends ConsumerWidget {
  const _GoalSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goal = ref.watch(dailyGoalMinutesProvider);
    return Card(
      child: RadioGroup<int>(
        groupValue: goal,
        onChanged: (v) {
          if (v != null) ref.read(preferencesRepositoryProvider).setDailyGoal(v);
        },
        child: Column(
          children: [
            for (final p in kDailyGoalPresets)
              RadioListTile<int>(
                title: Text('${p.label}  ·  ${p.minutes} min'),
                value: p.minutes,
              ),
          ],
        ),
      ),
    );
  }
}

class _ThemeSection extends ConsumerWidget {
  const _ThemeSection();

  static const _options = [
    ('system', 'System'),
    ('light', 'Light'),
    ('dark', 'Dark'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(preferencesStreamProvider).value?.themeMode ?? 'system';
    return Card(
      child: RadioGroup<String>(
        groupValue: mode,
        onChanged: (v) {
          if (v != null) ref.read(preferencesRepositoryProvider).setThemeMode(v);
        },
        child: Column(
          children: [
            for (final o in _options)
              RadioListTile<String>(title: Text(o.$2), value: o.$1),
          ],
        ),
      ),
    );
  }
}

class _ResetSection extends ConsumerWidget {
  const _ResetSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).colorScheme.errorContainer.withValues(alpha: 0.3),
      child: ListTile(
        title: const Text('Reset progress'),
        subtitle: const Text('Erases streaks, sessions, and mastery for the current language.'),
        trailing: const Icon(Icons.delete_outline),
        onTap: () => _confirmReset(context, ref),
      ),
    );
  }

  Future<void> _confirmReset(BuildContext context, WidgetRef ref) async {
    final code = ref.read(activeLanguageCodeProvider);
    if (code == null) return;
    final ok = await _showConfirm(context);
    if (ok != true) return;
    await ref.read(cardProgressRepositoryProvider).resetForLanguage(code);
  }

  Future<bool?> _showConfirm(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Reset progress?'),
        content: const Text('This action cannot be undone.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Reset')),
        ],
      ),
    );
  }
}
