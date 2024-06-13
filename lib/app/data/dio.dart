import 'package:dio/dio.dart';

class DioService {
  DioService._internal();
  static final DioService instance = DioService._internal();
  factory DioService() => instance;

  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.github.com/',
    ),
  );
}
