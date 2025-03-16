import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await _getAuthToken();
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    options.headers["Content-Type"] = "application/json";
    print("ALALALAL");
    super.onRequest(options, handler);
  }

  Future<String> _getAuthToken() async {
    return "return auth token";
  }
}
