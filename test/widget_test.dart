import 'package:drift/drift.dart' as drift;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:offline_language_app/app.dart';
import 'package:offline_language_app/core/services/content_seeder.dart';
import 'package:offline_language_app/core/services/database.dart';

void main() {
  testWidgets('App boots into onboarding when not yet onboarded', (tester) async {
    final db = AppDatabase(drift.DatabaseConnection(NativeDatabase.memory()));
    await ContentSeeder(db).seedIfEmpty();

    await tester.pumpWidget(ProviderScope(
      overrides: [appDatabaseProvider.overrideWithValue(db)],
      child: const App(),
    ));
    await tester.pump(); // resolve initial async load
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.text('Get started'), findsOneWidget);

    await db.close();
  });
}
