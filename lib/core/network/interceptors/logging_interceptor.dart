import 'package:dio/dio.dart';

import '../../utils/logger.dart';

class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({this.verbose = false});
  final bool verbose;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log.i('→ ${options.method} ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log.i('← ${response.statusCode} ${response.requestOptions.uri.path}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log.w('✗ ${err.requestOptions.uri.path} (${err.type.name})');
    handler.next(err);
  }
}
