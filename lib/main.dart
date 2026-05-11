import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'app.dart';
import 'core/services/content_seeder.dart';
import 'core/services/database.dart';
import 'core/services/secure_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final secure = SecureStorageService(const FlutterSecureStorage());
  final dbKey = await secure.getOrCreateDbKey();
  final db = AppDatabase(openEncryptedDb(dbKey));
  await ContentSeeder(db).seedIfEmpty();

  runApp(ProviderScope(
    overrides: [
      secureStorageProvider.overrideWithValue(secure),
      appDatabaseProvider.overrideWithValue(db),
    ],
    child: const App(),
  ));
}
