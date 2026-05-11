import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'app.dart';
import 'core/network/api_client.dart';
import 'core/network/api_config.dart';
import 'core/services/content_seeder.dart';
import 'core/services/database.dart';
import 'core/services/secure_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _loadEnv();
  final secure = SecureStorageService(const FlutterSecureStorage());
  final dbKey = await secure.getOrCreateDbKey();
  final db = AppDatabase(openEncryptedDb(dbKey));
  await ContentSeeder(db).seedIfEmpty();
  final api = ApiClient.build(ApiConfig.fromEnv());

  runApp(ProviderScope(
    overrides: [
      secureStorageProvider.overrideWithValue(secure),
      appDatabaseProvider.overrideWithValue(db),
      apiClientProvider.overrideWithValue(api),
    ],
    child: const App(),
  ));
}

Future<void> _loadEnv() async {
  try {
    await dotenv.load();
  } catch (_) {
    // .env missing is non-fatal — ApiConfig.fromEnv falls back to defaults.
  }
}
