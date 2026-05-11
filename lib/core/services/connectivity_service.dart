import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectivityService {
  ConnectivityService(this._connectivity);
  final Connectivity _connectivity;

  Stream<List<ConnectivityResult>> get onChange => _connectivity.onConnectivityChanged;

  // Real check: OS reports a network AND a 500ms DNS probe succeeds.
  Future<bool> hasInternet() async {
    final results = await _connectivity.checkConnectivity();
    if (results.every((r) => r == ConnectivityResult.none)) return false;
    return _ping();
  }

  Future<bool> _ping() async {
    try {
      final r = await InternetAddress.lookup('one.one.one.one')
          .timeout(const Duration(milliseconds: 500));
      return r.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}

final connectivityServiceProvider = Provider<ConnectivityService>((ref) {
  return ConnectivityService(Connectivity());
});

final connectivityStreamProvider = StreamProvider<List<ConnectivityResult>>((ref) {
  return ref.watch(connectivityServiceProvider).onChange;
});

final isOnlineProvider = Provider<bool>((ref) {
  final results = ref.watch(connectivityStreamProvider).value ?? [];
  return results.any((r) => r != ConnectivityResult.none);
});
