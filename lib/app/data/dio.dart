import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioInstance {
  DioInstance._internal();
  static final DioInstance instance = DioInstance._internal();
  factory DioInstance() => instance;

  Dio service = Dio(
    BaseOptions(
      baseUrl: dotenv.get('BASE_URL'),
    ),
  );
}
