import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitledtest/NetworkCallDio.dart';

import 'EmailandLogin.dart';

class LoginHandler extends HookConsumerWidget {
  const LoginHandler({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height:deviceHeight ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: deviceHeight / 5.5,
                child: Center(
                  child: Image.asset(
                    "assets/ic_login.png",
                  ),
                ),

              ),
              const SizedBox(height: 30,),
              const EmailandLoginField(),
               NetworkCallDio(),
            ],
          ),
        ),
      ),
    ));
  }
}
