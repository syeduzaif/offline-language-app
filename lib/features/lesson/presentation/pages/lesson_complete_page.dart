import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';

class LessonCompletePage extends StatefulWidget {
  const LessonCompletePage({super.key, required this.cardsReviewed});
  final int cardsReviewed;

  @override
  State<LessonCompletePage> createState() => _LessonCompletePageState();
}

class _LessonCompletePageState extends State<LessonCompletePage> {
  late final ConfettiController _confetti;

  @override
  void initState() {
    super.initState();
    _confetti = ConfettiController(duration: kCelebrationDuration)..play();
  }

  @override
  void dispose() {
    _confetti.dispose();
    super.dispose();
  }

  void _close() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            _Body(cardsReviewed: widget.cardsReviewed, onClose: _close),
            ConfettiWidget(
              confettiController: _confetti,
              blastDirectionality: BlastDirectionality.explosive,
              numberOfParticles: 24,
              maxBlastForce: 20,
              minBlastForce: 8,
              gravity: 0.3,
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.cardsReviewed, required this.onClose});
  final int cardsReviewed;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const _Celebration(),
          const SizedBox(height: 24),
          _Stats(cardsReviewed: cardsReviewed),
          const Spacer(),
          FilledButton(onPressed: onClose, child: const Text('Continue')),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _Celebration extends StatelessWidget {
  const _Celebration();

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Column(
      children: [
        const Text('🎉', style: TextStyle(fontSize: 96)),
        const SizedBox(height: 16),
        Text('Lesson complete!',
            textAlign: TextAlign.center,
            style: tt.displaySmall?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _Stats extends StatelessWidget {
  const _Stats({required this.cardsReviewed});
  final int cardsReviewed;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _StatTile(label: 'Cards', value: '$cardsReviewed', tt: tt),
            _StatTile(label: 'Streak', value: '+1', tt: tt),
          ],
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.label, required this.value, required this.tt});
  final String label;
  final String value;
  final TextTheme tt;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: tt.headlineMedium),
        Text(label, style: tt.bodyMedium),
      ],
    );
  }
}
