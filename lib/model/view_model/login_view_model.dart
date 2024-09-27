import 'package:flutter/material.dart';
import 'package:media_reels/model/object_model/index.dart';

class LoginViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final LoginModel loginModel = const LoginModel(userName: "", passWord: "");

  void updateUserName(String email) {
    loginModel.copyWith(userName: email);
  }

  void updatePassWord(String passWord) {
    loginModel.copyWith(passWord: passWord);
  }

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      print("---> validator");
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password should be at least 8 characters long';
    }
    return "";
  }
}
