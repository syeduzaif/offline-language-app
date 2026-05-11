enum CardRating { hard, okay, easy }

extension CardRatingScore on CardRating {
  int get sm2Quality => switch (this) {
        CardRating.hard => 2,
        CardRating.okay => 4,
        CardRating.easy => 5,
      };
}

class SrsState {
  const SrsState({
    required this.repetitions,
    required this.intervalDays,
    required this.easeFactor,
    required this.nextDueAt,
  });
  final int repetitions;
  final int intervalDays;
  final double easeFactor;
  final DateTime nextDueAt;
}

class SrsAlgorithm {
  const SrsAlgorithm._();

  static SrsState review({
    required CardRating rating,
    required int repetitions,
    required int intervalDays,
    required double easeFactor,
    DateTime? now,
  }) {
    final q = rating.sm2Quality;
    final newEase = _newEase(easeFactor, q);
    if (q < 3) return _failed(newEase, now);
    return _passed(repetitions, intervalDays, newEase, now);
  }

  static SrsState _failed(double newEase, DateTime? now) {
    final ts = now ?? DateTime.now();
    return SrsState(
      repetitions: 0, intervalDays: 1, easeFactor: newEase,
      nextDueAt: ts.add(const Duration(days: 1)),
    );
  }

  static SrsState _passed(int reps, int prevInterval, double newEase, DateTime? now) {
    final ts = now ?? DateTime.now();
    final newReps = reps + 1;
    final newInterval = _intervalFor(newReps, prevInterval, newEase);
    return SrsState(
      repetitions: newReps, intervalDays: newInterval, easeFactor: newEase,
      nextDueAt: ts.add(Duration(days: newInterval)),
    );
  }

  static int _intervalFor(int newReps, int prevInterval, double ease) {
    if (newReps == 1) return 1;
    if (newReps == 2) return 6;
    return (prevInterval * ease).round();
  }

  static double _newEase(double prev, int q) {
    final next = prev + (0.1 - (5 - q) * (0.08 + (5 - q) * 0.02));
    return next < 1.3 ? 1.3 : next;
  }
}
