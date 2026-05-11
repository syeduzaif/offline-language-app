import 'package:drift/drift.dart' show Value;
import 'package:flutter_test/flutter_test.dart';
import 'package:offline_language_app/core/services/database.dart';
import 'package:offline_language_app/features/quiz/domain/quiz_question.dart';

Phrase _phrase(String id, String prompt, String target) => Phrase(
      id: id, packId: 'p', languageCode: 'es',
      nativePrompt: prompt, targetText: target, displayOrder: 0,
    );

void main() {
  final deck = [
    _phrase('1', 'Hello', 'Hola'),
    _phrase('2', 'Bread', 'Pan'),
    _phrase('3', 'Water', 'Agua'),
    _phrase('4', 'Coffee', 'Café'),
    _phrase('5', 'Yes', 'Sí'),
  ];

  test('generate produces expected number of questions', () {
    final qs = QuizGenerator.generate(deck, count: 4);
    expect(qs.length, 4);
  });

  test('multiple choice questions include correct answer in options', () {
    final qs = QuizGenerator.generate(deck, count: 5);
    for (final q in qs.where((q) => q.mode == QuizMode.multipleChoice)) {
      expect(q.options.contains(q.correctAnswer), isTrue);
    }
  });

  test('isCorrect normalizes case and whitespace', () {
    final q = QuizQuestion(phrase: deck.first, mode: QuizMode.fillInBlank, options: const []);
    expect(QuizGenerator.isCorrect(q, '  HOLA '), isTrue);
    expect(QuizGenerator.isCorrect(q, 'hola'), isTrue);
    expect(QuizGenerator.isCorrect(q, 'wrong'), isFalse);
  });

  // Suppress unused warning — Value is exported via drift; this keeps the import live
  // for future seed-helper expansion.
  test('Value is constructible (drift import smoke)', () {
    expect(const Value(1).present, isTrue);
  });
}
