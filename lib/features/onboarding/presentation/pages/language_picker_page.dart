import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../preferences/data/repositories/preferences_repository.dart';
import 'daily_goal_page.dart';

class LanguagePickerPage extends ConsumerWidget {
  const LanguagePickerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick a language')),
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: ListView.separated(
            itemCount: kSupportedLanguages.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (_, i) => _LanguageCard(
              language: kSupportedLanguages[i],
              onTap: () => _select(context, ref, kSupportedLanguages[i].code),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _select(BuildContext context, WidgetRef ref, String code) async {
    await ref.read(preferencesRepositoryProvider).setLanguage(code);
    if (!context.mounted) return;
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const DailyGoalPage()));
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard({required this.language, required this.onTap});
  final SupportedLanguage language;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Row(
            children: [
              Text(language.flag, style: const TextStyle(fontSize: 40)),
              const SizedBox(width: 16),
              Expanded(child: _LanguageNames(language: language)),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageNames extends StatelessWidget {
  const _LanguageNames({required this.language});
  final SupportedLanguage language;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(language.englishName, style: tt.titleLarge),
        Text(language.nativeName, style: tt.bodyMedium),
      ],
    );
  }
}
