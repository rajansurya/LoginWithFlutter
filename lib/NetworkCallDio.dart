import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

class NetworkCallDio extends HookConsumerWidget {
  NetworkCallDio({super.key});

  final Logger logger = Logger();

  Future<void> getData() async {
    await Dio().get("https://jsonplaceholder.typicode.com/posts").then((value) {
      logger.d(value);
    });
  }

  Future<void> postData() async {
    await Dio()
        .post("https://jsonplaceholder.typicode.com/posts",
            queryParameters: {"title": "foo", "body": "bar", "userId": 2},
            options: Options(headers: <String, String>{
              'Content-Type': 'application/json; charset=utf-8'
            }))
        .then((value) {
      logger.d(value);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      onPressed: () {
        getData();
      },
      color: Colors.amber,
      child: const Text("Post Data"),
    );
  }
}
