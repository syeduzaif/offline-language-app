import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/database.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/srs.dart';
import '../controllers/lesson_controller.dart';
import 'lesson_complete_page.dart';

class LessonPage extends ConsumerStatefulWidget {
  const LessonPage({super.key, required this.languageCode, this.packId});
  final String languageCode;
  final String? packId;

  @override
  ConsumerState<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends ConsumerState<LessonPage> {
  late final LessonRunner _runner;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _runner = LessonRunner(ref, languageCode: widget.languageCode, packId: widget.packId);
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    await _runner.start();
    if (mounted) setState(() => _ready = true);
  }

  void _flip() => setState(_runner.flip);

  Future<void> _rate(CardRating r) async {
    await _runner.rate(r);
    if (!mounted) return;
    if (_runner.isComplete) {
      _navigateToComplete();
    } else {
      setState(() {});
    }
  }

  void _navigateToComplete() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (_) => LessonCompletePage(cardsReviewed: _runner.total),
    ));
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) return const Scaffold(body: LoadingWidget());
    if (_runner.cards.isEmpty) return const _EmptyDeck();
    return Scaffold(
      appBar: AppBar(title: Text('${_runner.index + 1} / ${_runner.total}')),
      body: SafeArea(child: _LessonBody(runner: _runner, onFlip: _flip, onRate: _rate)),
    );
  }
}

class _EmptyDeck extends StatelessWidget {
  const _EmptyDeck();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('No cards available — try again later.')),
    );
  }
}

class _LessonBody extends StatelessWidget {
  const _LessonBody({required this.runner, required this.onFlip, required this.onRate});
  final LessonRunner runner;
  final VoidCallback onFlip;
  final ValueChanged<CardRating> onRate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPagePadding,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(child: _Card(phrase: runner.current!, flipped: runner.flipped, onTap: onFlip)),
          const SizedBox(height: 16),
          if (runner.flipped) _RatingButtons(onRate: onRate) else const _TapToFlipHint(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.phrase, required this.flipped, required this.onTap});
  final Phrase phrase;
  final bool flipped;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: AnimatedSwitcher(
              duration: kCardFlipDuration,
              child: flipped ? _BackFace(phrase: phrase) : _FrontFace(phrase: phrase),
            ),
          ),
        ),
      ),
    );
  }
}

class _FrontFace extends StatelessWidget {
  const _FrontFace({required this.phrase});
  final Phrase phrase;

  @override
  Widget build(BuildContext context) {
    return Text(
      phrase.nativePrompt,
      key: const ValueKey('front'),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class _BackFace extends StatelessWidget {
  const _BackFace({required this.phrase});
  final Phrase phrase;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const ValueKey('back'),
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(phrase.targetText, textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge),
        if (phrase.pronunciation != null) ...[
          const SizedBox(height: 12),
          Text(phrase.pronunciation!,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center),
        ],
      ],
    );
  }
}

class _TapToFlipHint extends StatelessWidget {
  const _TapToFlipHint();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Center(
        child: Text('Tap card to reveal',
            style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}

class _RatingButtons extends StatelessWidget {
  const _RatingButtons({required this.onRate});
  final ValueChanged<CardRating> onRate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _RatingButton(rating: CardRating.hard, label: 'Hard',
            color: Colors.red.shade400, onTap: onRate)),
        const SizedBox(width: 8),
        Expanded(child: _RatingButton(rating: CardRating.okay, label: 'Okay',
            color: Colors.blue.shade400, onTap: onRate)),
        const SizedBox(width: 8),
        Expanded(child: _RatingButton(rating: CardRating.easy, label: 'Easy',
            color: Colors.green.shade400, onTap: onRate)),
      ],
    );
  }
}

class _RatingButton extends StatelessWidget {
  const _RatingButton({
    required this.rating, required this.label, required this.color, required this.onTap,
  });
  final CardRating rating;
  final String label;
  final Color color;
  final ValueChanged<CardRating> onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(backgroundColor: color),
      onPressed: () => onTap(rating),
      child: Text(label),
    );
  }
}
