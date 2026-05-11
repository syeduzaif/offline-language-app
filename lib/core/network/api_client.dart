import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_config.dart';
import 'interceptors/error_mapper_interceptor.dart';
import 'interceptors/logging_interceptor.dart';

class ApiClient {
  ApiClient(this.dio);
  final Dio dio;

  factory ApiClient.build(ApiConfig config) {
    final dio = Dio(BaseOptions(
      connectTimeout: config.connectTimeout,
      sendTimeout: config.sendTimeout,
      receiveTimeout: config.receiveTimeout,
    ));
    dio.interceptors.addAll([
      LoggingInterceptor(verbose: config.verboseLogging),
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          policy: CachePolicy.request,
          maxStale: config.maxCacheStale,
        ),
      ),
      ErrorMapperInterceptor(),
    ]);
    return ApiClient(dio);
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  throw UnimplementedError('Override in ProviderScope.');
});
