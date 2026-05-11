enum ApiExceptionKind {
  timeout,
  network,
  notFound,
  rateLimited,
  serverError,
  badResponse,
  cancelled,
  unknown,
}

class ApiException implements Exception {
  ApiException({required this.kind, required this.message, this.statusCode});

  final ApiExceptionKind kind;
  final String message;
  final int? statusCode;

  @override
  String toString() => 'ApiException($kind): $message';
}
