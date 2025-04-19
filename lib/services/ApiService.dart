import 'package:dio/dio.dart';
import 'package:untitledtest/services/AuthInterceptor.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options = BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 20));
    _dio.interceptors.addAll([
      AuthInterceptor(),
    ]

    );
  }

  Future<List<dynamic>> fetchPosts() async {
    try {
      Response response = await _dio.get("/posts");
      return response.data;
    } catch (e) {
      throw Exception("ssss");
    }
  }
}
