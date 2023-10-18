import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Back4AppCustomDio {
  final Dio _dio = Dio();

  Back4AppCustomDio() {
    _dio.options.headers["X-Parse-Application-Id"] =
        dotenv.get('BACK4APPPLICATIONID');

    _dio.options.headers["X-Parse-REST-API-Key"] =
        dotenv.get('BACK4APPPLICATIONRESTAPIKEY');
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = dotenv.get('BACK4APPPLICATIONBASEURL');
  }

  Dio get dio => _dio;
}
