import 'package:dio/dio.dart';

class ApiClient {
  static Dio get client{
    final Dio dio = Dio();
    dio.options.baseUrl = 'https://api.escuelajs.co';
    return dio;
  }
}