import 'package:flutter_dotenv/flutter_dotenv.dart';

// Reads runtime config from .env with safe fallbacks.
class ApiConfig {
  ApiConfig({
    required this.connectTimeout,
    required this.sendTimeout,
    required this.receiveTimeout,
    required this.maxCacheStale,
    this.verboseLogging = false,
  });

  final Duration connectTimeout;
  final Duration sendTimeout;
  final Duration receiveTimeout;
  final Duration maxCacheStale;
  final bool verboseLogging;

  factory ApiConfig.fromEnv() {
    return ApiConfig(
      connectTimeout: _ms('CONNECTION_TIMEOUT_MS', 30000),
      sendTimeout: _ms('SEND_TIMEOUT_MS', 30000),
      receiveTimeout: _ms('RECEIVE_TIMEOUT_MS', 30000),
      maxCacheStale: Duration(days: _int('CACHE_MAX_STALE_DAYS', 7)),
    );
  }

  static Duration _ms(String key, int fallback) => Duration(milliseconds: _int(key, fallback));
  static int _int(String key, int fallback) => int.tryParse(env(key) ?? '') ?? fallback;
}

// Safe .env lookup — returns null if dotenv wasn't loaded (e.g. in tests).
String? env(String key) {
  try {
    return dotenv.env[key];
  } catch (_) {
    return null;
  }
}

class ApiHost {
  const ApiHost({required this.name, required this.baseUrl, this.version = ''});
  final String name;
  final String baseUrl;
  final String version;

  String get url => version.isEmpty ? baseUrl : '$baseUrl/$version';
}

// The only place to register a new backend.
class ApiHosts {
  static ApiHost get translation => ApiHost(
        name: 'translation',
        baseUrl: env('TRANSLATION_BASE_URL') ?? 'https://api.mymemory.translated.net',
      );
}
