import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitledtest/services/ApiService.dart';
import 'package:untitledtest/services/AuthInterceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.interceptors.add(AuthInterceptor());
  return dio;
});

final apiServicesProvider=Provider<ApiService>((ref){
  final dio=ref.watch(dioProvider);
  return ApiService(dio);
});

final postProvider=Provider<Future<List<dynamic>>>((ref){
  final apiService=ref.watch(apiServicesProvider);
  return apiService.fetchPosts();
});

final postsProvider = FutureProvider<List<dynamic>>((ref) {
  final apiService = ref.watch(apiServicesProvider);
  return apiService.fetchPosts();
});