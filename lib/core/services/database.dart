import 'dart:ffi';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';
import 'package:sqlite3/open.dart';

import '../constants/app_constants.dart';
import 'database_tables/active_lessons_table.dart';
import 'database_tables/card_progress_table.dart';
import 'database_tables/languages_table.dart';
import 'database_tables/lesson_sessions_table.dart';
import 'database_tables/phrases_table.dart';
import 'database_tables/streaks_table.dart';
import 'database_tables/topic_packs_table.dart';
import 'database_tables/user_preferences_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [
  Languages,
  TopicPacks,
  Phrases,
  UserPreferences,
  CardProgress,
  LessonSessions,
  Streaks,
  ActiveLessons,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(activeLessons);
            await m.addColumn(userPreferences, userPreferences.lastQuizAt);
          }
        },
      );
}

LazyDatabase openEncryptedDb(String passphrase) {
  return LazyDatabase(() async {
    await applyWorkaroundToOpenSqlCipherOnOldAndroidVersions();
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, kDbFileName));
    return NativeDatabase.createInBackground(
      file,
      isolateSetup: _registerCipherLoader,
      setup: (raw) {
        raw.execute("PRAGMA key = '$passphrase';");
        raw.execute('PRAGMA foreign_keys = ON;');
      },
    );
  });
}

Future<void> _registerCipherLoader() async {
  open
    ..overrideFor(OperatingSystem.android, _openCipherAndroid)
    ..overrideFor(OperatingSystem.iOS, _openCipherIos)
    ..overrideFor(OperatingSystem.macOS, _openCipherIos);
}

DynamicLibrary _openCipherAndroid() => DynamicLibrary.open('libsqlcipher.so');
DynamicLibrary _openCipherIos() => DynamicLibrary.process();

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('Override in ProviderScope.');
});
