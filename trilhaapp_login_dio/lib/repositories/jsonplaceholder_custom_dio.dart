import 'package:dio/dio.dart';

class JsonPlaceHolderCustomDio {
  final Dio _dio = Dio();
  Dio get dio => _dio;
  JsonPlaceHolderCustomDio() {
    _dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
  }
}
