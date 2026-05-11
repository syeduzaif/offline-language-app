import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../preferences/data/repositories/preferences_repository.dart';
import 'language_picker_page.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const _Hero(),
              const Spacer(),
              FilledButton(
                onPressed: () => _next(context),
                child: const Text('Get started'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => _skip(context, ref),
                child: const Text('Skip — just try the app'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  void _next(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const LanguagePickerPage()));
  }

  Future<void> _skip(BuildContext context, WidgetRef ref) async {
    final repo = ref.read(preferencesRepositoryProvider);
    await repo.setLanguage(kSupportedLanguages.first.code);
    await repo.setDailyGoal(kDailyGoalPresets[1].minutes);
    await repo.markOnboarded();
  }
}

class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Column(
      children: [
        const Text('🌍', style: TextStyle(fontSize: 96)),
        const SizedBox(height: 24),
        Text(kAppName, style: tt.displayMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Text('Learn a language. Offline. Forever.',
            textAlign: TextAlign.center, style: tt.titleMedium),
      ],
    );
  }
}
