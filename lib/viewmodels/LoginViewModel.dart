import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitledtest/models/UserLog.dart';

import '../ComponentWidgth.dart';

final loginViewModelProvider =
    ChangeNotifierProvider.autoDispose<LoginViewModel>(
        (ref) => LoginViewModel());
final authStateProvider = StreamProvider<UserLog?>((ref) {
  return ref
      .read(loginViewModelProvider as ProviderListenable<Stream<UserLog?>>);
});

class LoginViewModel extends ChangeNotifier {
  bool isObscure = true;

  toggleObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  Future<void> createEmailPassword(
      BuildContext context, String email, String password) async {
    DialogBox(context,"Error");
    // await
  }
}
