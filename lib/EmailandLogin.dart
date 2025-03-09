import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitledtest/viewmodels/LoginViewModel.dart';

import 'StatelessButton.dart';

TextEditingController _emailField = TextEditingController();
TextEditingController _passwordField = TextEditingController();

class EmailandLoginField extends HookConsumerWidget {
  const EmailandLoginField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProder = ref.watch(loginViewModelProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            width: 350,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              controller: _emailField,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.email),
                  hintText: "Email"),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 350,
            child: TextFormField(
              controller: _passwordField,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  prefixIcon: IconButton(
                      onPressed: viewModelProder.toggleObscure,
                      icon: Icon(viewModelProder.isObscure
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  hintText: "Password"),
              obscureText: viewModelProder.isObscure,
            ),
          ),
          const SizedBox(height: 30,),
          const RegisterLoginButton()
        ],
      ),
    );
  }
}

class RegisterLoginButton extends HookConsumerWidget {
  const RegisterLoginButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProvider = ref.watch(loginViewModelProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          child: MaterialButton(
            onPressed:()async{
              viewModelProvider.createEmailPassword(context, _emailField.text, _passwordField.text);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.green,
            child: const RegisterButton(
              text: "Register/Login",
              size: 100,
            ),
          ),
        )
      ],
    );
  }
}
