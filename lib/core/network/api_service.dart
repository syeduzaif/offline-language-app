import 'package:dio/dio.dart';

import '../services/connectivity_service.dart';
import '../utils/logger.dart';
import 'api_client.dart';
import 'api_config.dart';
import 'api_exception.dart';

// Base class for every backend integration. Subclass once per host, then add
// typed methods that call getJson / postJson.
abstract class ApiService {
  ApiService(
    this.client,
    this.connectivity, {
    required this.host,
    required this.name,
  });

  final ApiClient client;
  final ConnectivityService connectivity;
  final ApiHost host;
  final String name;

  Future<T> getJson<T>(
    String path, {
    Map<String, dynamic>? query,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final response = await _request('GET', path, query: query);
    return _decode(response, fromJson);
  }

  Future<T> postJson<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? query,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final response = await _request('POST', path, body: body, query: query);
    return _decode(response, fromJson);
  }

  // Single HTTP entry point: log, gate on connectivity, send.
  Future<Response> _request(
    String method,
    String path, {
    Map<String, dynamic>? query,
    Object? body,
  }) async {
    log.i('[$name] $method $path');
    if (!await connectivity.hasInternet()) {
      throw ApiException(kind: ApiExceptionKind.network, message: 'No internet connection');
    }
    try {
      return await client.dio.request(
        '${host.url}$path',
        data: body,
        queryParameters: query,
        options: Options(
          method: method,
          contentType: body is FormData ? Headers.multipartFormDataContentType : null,
        ),
      );
    } on DioException catch (e) {
      throw e.error is ApiException
          ? e.error as ApiException
          : ApiException(kind: ApiExceptionKind.unknown, message: e.message ?? 'unknown');
    }
  }

  T _decode<T>(Response response, T Function(Map<String, dynamic>) fromJson) {
    final data = response.data;
    if (data is! Map<String, dynamic>) {
      throw ApiException(kind: ApiExceptionKind.badResponse, message: 'Bad JSON response');
    }
    return fromJson(data);
  }
}
