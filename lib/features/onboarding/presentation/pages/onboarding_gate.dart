import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/error_text.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../home/presentation/pages/home_shell.dart';
import '../../../preferences/data/repositories/preferences_repository.dart';
import 'welcome_page.dart';

class OnboardingGate extends ConsumerWidget {
  const OnboardingGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(preferencesStreamProvider);
    return prefs.when(
      data: (p) => p?.onboardedAt == null ? const WelcomePage() : const HomeShell(),
      loading: () => const Scaffold(body: LoadingWidget()),
      error: (e, _) => Scaffold(body: ErrorText(message: e.toString())),
    );
  }
}
