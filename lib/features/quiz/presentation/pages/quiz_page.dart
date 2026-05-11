import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../packs/data/repositories/packs_repository.dart';
import '../../../preferences/data/repositories/preferences_repository.dart';
import '../../domain/quiz_question.dart';

class QuizPage extends ConsumerStatefulWidget {
  const QuizPage({super.key, required this.languageCode});
  final String languageCode;

  @override
  ConsumerState<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ConsumerState<QuizPage> {
  List<QuizQuestion> _questions = const [];
  int _index = 0;
  int _correct = 0;
  bool _ready = false;
  bool? _lastAnswerCorrect;

  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    final deck = await ref.read(packsRepositoryProvider).watchPhrasesByLanguage(widget.languageCode).first;
    if (!mounted) return;
    setState(() {
      _questions = QuizGenerator.generate(deck);
      _ready = true;
    });
  }

  void _submit(String answer) {
    final ok = QuizGenerator.isCorrect(_questions[_index], answer);
    setState(() {
      _lastAnswerCorrect = ok;
      if (ok) _correct += 1;
    });
  }

  void _next() {
    setState(() {
      _index += 1;
      _lastAnswerCorrect = null;
    });
    if (_index >= _questions.length) {
      ref.read(preferencesRepositoryProvider).markQuizTaken();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) return const Scaffold(body: LoadingWidget());
    if (_questions.isEmpty) return const _EmptyQuiz();
    if (_index >= _questions.length) {
      return _QuizSummary(correct: _correct, total: _questions.length);
    }
    return _QuizScaffold(
      index: _index,
      total: _questions.length,
      question: _questions[_index],
      lastResult: _lastAnswerCorrect,
      onSubmit: _submit,
      onNext: _next,
    );
  }
}

class _EmptyQuiz extends StatelessWidget {
  const _EmptyQuiz();

  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Not enough cards yet for a quiz.')));
}

class _QuizScaffold extends StatelessWidget {
  const _QuizScaffold({
    required this.index, required this.total, required this.question,
    required this.lastResult, required this.onSubmit, required this.onNext,
  });
  final int index;
  final int total;
  final QuizQuestion question;
  final bool? lastResult;
  final ValueChanged<String> onSubmit;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz ${index + 1} / $total')),
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: lastResult == null
              ? _QuestionView(question: question, onSubmit: onSubmit)
              : _FeedbackView(question: question, correct: lastResult!, onNext: onNext),
        ),
      ),
    );
  }
}

class _QuestionView extends StatelessWidget {
  const _QuestionView({required this.question, required this.onSubmit});
  final QuizQuestion question;
  final ValueChanged<String> onSubmit;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        Text(question.phrase.nativePrompt, textAlign: TextAlign.center, style: tt.headlineSmall),
        const SizedBox(height: 32),
        if (question.mode == QuizMode.multipleChoice)
          _MultipleChoiceOptions(question: question, onSubmit: onSubmit)
        else
          _FillInBlankInput(onSubmit: onSubmit),
      ],
    );
  }
}

class _MultipleChoiceOptions extends StatelessWidget {
  const _MultipleChoiceOptions({required this.question, required this.onSubmit});
  final QuizQuestion question;
  final ValueChanged<String> onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final opt in question.options) ...[
          OutlinedButton(onPressed: () => onSubmit(opt), child: Text(opt)),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

class _FillInBlankInput extends StatefulWidget {
  const _FillInBlankInput({required this.onSubmit});
  final ValueChanged<String> onSubmit;

  @override
  State<_FillInBlankInput> createState() => _FillInBlankInputState();
}

class _FillInBlankInputState extends State<_FillInBlankInput> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          autofocus: true,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Type the answer'),
          onSubmitted: widget.onSubmit,
        ),
        const SizedBox(height: 16),
        FilledButton(onPressed: () => widget.onSubmit(_controller.text), child: const Text('Submit')),
      ],
    );
  }
}

class _FeedbackView extends StatelessWidget {
  const _FeedbackView({required this.question, required this.correct, required this.onNext});
  final QuizQuestion question;
  final bool correct;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final color = correct ? Colors.green.shade400 : Colors.red.shade400;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 32),
        Icon(correct ? Icons.check_circle : Icons.cancel, color: color, size: 96),
        const SizedBox(height: 16),
        Text(correct ? 'Correct!' : 'Not quite',
            textAlign: TextAlign.center, style: tt.headlineMedium),
        const SizedBox(height: 24),
        Text('Answer: ${question.correctAnswer}',
            textAlign: TextAlign.center, style: tt.titleLarge),
        const Spacer(),
        FilledButton(onPressed: onNext, child: const Text('Next')),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _QuizSummary extends StatelessWidget {
  const _QuizSummary({required this.correct, required this.total});
  final int correct;
  final int total;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text('$correct / $total',
                  textAlign: TextAlign.center,
                  style: tt.displayLarge?.copyWith(fontWeight: FontWeight.bold)),
              Text('Quiz complete', textAlign: TextAlign.center, style: tt.titleLarge),
              const Spacer(),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Done'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
