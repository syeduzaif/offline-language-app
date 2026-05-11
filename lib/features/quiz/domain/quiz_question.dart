import '../../../core/services/database.dart';

enum QuizMode { multipleChoice, fillInBlank }

class QuizQuestion {
  const QuizQuestion({
    required this.phrase,
    required this.mode,
    required this.options,
  });
  final Phrase phrase;
  final QuizMode mode;
  final List<String> options;

  String get correctAnswer => phrase.targetText;
}

class QuizGenerator {
  const QuizGenerator._();

  static List<QuizQuestion> generate(List<Phrase> deck, {int count = 5}) {
    if (deck.isEmpty) return const [];
    final shuffled = [...deck]..shuffle();
    final picked = shuffled.take(count).toList();
    return [
      for (var i = 0; i < picked.length; i++)
        _question(picked[i], deck, i.isEven ? QuizMode.multipleChoice : QuizMode.fillInBlank),
    ];
  }

  static QuizQuestion _question(Phrase target, List<Phrase> deck, QuizMode mode) {
    if (mode == QuizMode.fillInBlank) {
      return QuizQuestion(phrase: target, mode: mode, options: const []);
    }
    return QuizQuestion(phrase: target, mode: mode, options: _distractors(target, deck));
  }

  static List<String> _distractors(Phrase target, List<Phrase> deck) {
    final pool = deck.where((p) => p.id != target.id).toList()..shuffle();
    final picks = pool.take(3).map((p) => p.targetText).toList();
    final all = [...picks, target.targetText]..shuffle();
    return all;
  }

  static bool isCorrect(QuizQuestion q, String answer) {
    return _normalize(answer) == _normalize(q.correctAnswer);
  }

  static String _normalize(String s) => s.toLowerCase().trim();
}
