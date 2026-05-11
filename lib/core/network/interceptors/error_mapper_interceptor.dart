import 'package:dio/dio.dart';

import '../api_exception.dart';

// Converts every DioException into our ApiException so callers only catch one type.
class ErrorMapperInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final apiError = ApiException(
      kind: _kindFor(err),
      message: err.message ?? err.type.name,
      statusCode: err.response?.statusCode,
    );
    handler.reject(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: apiError,
      message: apiError.message,
    ));
  }

  ApiExceptionKind _kindFor(DioException err) {
    final code = err.response?.statusCode;
    if (code == 404) return ApiExceptionKind.notFound;
    if (code == 429) return ApiExceptionKind.rateLimited;
    if (code != null && code >= 500) return ApiExceptionKind.serverError;
    if (code != null) return ApiExceptionKind.badResponse;

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiExceptionKind.timeout;
      case DioExceptionType.connectionError:
        return ApiExceptionKind.network;
      case DioExceptionType.cancel:
        return ApiExceptionKind.cancelled;
      default:
        return ApiExceptionKind.unknown;
    }
  }
}
