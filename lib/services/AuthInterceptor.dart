import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor{
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
 @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
   String? token =await _getAuthToken();
   if (token != null) {
     options.headers["Authorization"] = "Bearer $token";  // Attach token to headers
   }
   options.headers["Content-Type"] = "application/json";

    super.onRequest(options, handler);
  }

  Future<String> _getAuthToken() async{
     return "return auth token";
  }
}