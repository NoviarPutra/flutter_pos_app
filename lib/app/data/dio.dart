import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioService {
  DioService._internal();
  static final DioService instance = DioService._internal();
  factory DioService() => instance;

  Dio dio = Dio(
    BaseOptions(
      baseUrl: dotenv.get('BASE_URL'),
    ),
  );
}
