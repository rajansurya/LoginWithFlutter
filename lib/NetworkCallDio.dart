import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

class Networkcalldio extends HookConsumerWidget {
  const Networkcalldio({super.key});

  /*@override
  State<Networkcalldio> createState() => _NetworkcalldioState();*/

  Future<void> getData() async {
    Logger logger = Logger();
    await Dio().get("https://jsonplaceholder.typicode.com/posts").then((value) {
      logger.d(value);
    });
  }

  Future<void> postData() async {
    await Dio()
        .post("https://jsonplaceholder.typicode.com/posts",
            queryParameters: {"title": "foo", "body": "bar", "userId": 1},
            options: Options(headers: <String, String>{
              'Content-Type': 'application/json; charset=utf-8'
            }))
        .then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      onPressed: () {
        postData();
      },object
      child: Text("Click Me"),
      color: Colors.amber,
    );
  }
}

class _NetworkcalldioState extends State<Networkcalldio> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
