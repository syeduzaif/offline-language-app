import 'dart:convert';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/app_constants.dart';

class SecureStorageService {
  SecureStorageService(this._storage);
  final FlutterSecureStorage _storage;

  static const _aOptions = AndroidOptions(encryptedSharedPreferences: true);
  static const _iOptions = IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  Future<String> getOrCreateDbKey() async {
    final existing = await _readKey();
    if (existing != null && existing.isNotEmpty) return existing;
    final fresh = _generateKey();
    await _storage.write(key: kDbEncryptionKeyAlias, value: fresh, aOptions: _aOptions, iOptions: _iOptions);
    return fresh;
  }

  Future<String?> _readKey() =>
      _storage.read(key: kDbEncryptionKeyAlias, aOptions: _aOptions, iOptions: _iOptions);

  String _generateKey() {
    final rand = Random.secure();
    final bytes = List<int>.generate(32, (_) => rand.nextInt(256));
    return base64UrlEncode(bytes);
  }
}

final secureStorageProvider = Provider<SecureStorageService>((ref) {
  throw UnimplementedError('Override in ProviderScope.');
});
