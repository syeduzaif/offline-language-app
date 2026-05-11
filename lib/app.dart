import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/app_constants.dart';
import 'core/themes/app_theme.dart';
import 'features/onboarding/presentation/pages/onboarding_gate.dart';
import 'features/preferences/data/repositories/preferences_repository.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(preferencesStreamProvider).value?.themeMode ?? 'system';
    return MaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: _resolve(mode),
      home: const OnboardingGate(),
    );
  }

  ThemeMode _resolve(String mode) => switch (mode) {
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.system,
      };
}
