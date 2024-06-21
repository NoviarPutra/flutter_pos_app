import 'package:dio/dio.dart';

class AppInterceptor extends Interceptor {
  AppInterceptor(this.dio);
  final Dio dio;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}
