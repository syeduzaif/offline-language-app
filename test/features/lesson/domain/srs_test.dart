import 'package:flutter_test/flutter_test.dart';
import 'package:offline_language_app/features/lesson/domain/srs.dart';

void main() {
  group('SrsAlgorithm', () {
    test('first easy review schedules 1 day out', () {
      final s = SrsAlgorithm.review(
        rating: CardRating.easy, repetitions: 0, intervalDays: 0, easeFactor: 2.5,
      );
      expect(s.repetitions, 1);
      expect(s.intervalDays, 1);
      expect(s.easeFactor, greaterThan(2.5));
    });

    test('second pass schedules 6 days out', () {
      final s = SrsAlgorithm.review(
        rating: CardRating.okay, repetitions: 1, intervalDays: 1, easeFactor: 2.5,
      );
      expect(s.repetitions, 2);
      expect(s.intervalDays, 6);
    });

    test('third pass uses ease factor', () {
      final s = SrsAlgorithm.review(
        rating: CardRating.okay, repetitions: 2, intervalDays: 6, easeFactor: 2.5,
      );
      expect(s.repetitions, 3);
      expect(s.intervalDays, 15); // 6 * 2.5 = 15
    });

    test('hard rating resets repetitions and drops ease', () {
      final s = SrsAlgorithm.review(
        rating: CardRating.hard, repetitions: 5, intervalDays: 30, easeFactor: 2.5,
      );
      expect(s.repetitions, 0);
      expect(s.intervalDays, 1);
      expect(s.easeFactor, lessThan(2.5));
    });

    test('ease factor never falls below 1.3', () {
      var ease = 2.5;
      for (var i = 0; i < 50; i++) {
        final s = SrsAlgorithm.review(
          rating: CardRating.hard, repetitions: 0, intervalDays: 1, easeFactor: ease,
        );
        ease = s.easeFactor;
      }
      expect(ease, greaterThanOrEqualTo(1.3));
    });
  });
}
