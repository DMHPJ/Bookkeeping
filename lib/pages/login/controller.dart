import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/api.dart';
import 'package:flutter_application_1/repository/appSettings.dart';
import 'package:flutter_application_1/repository/data/login_data.dart';
import 'package:flutter_application_1/repository/data/login_response_data.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LoginController extends GetxController {
  final logger = Logger();
  final loginFormKey = GlobalKey<FormState>();
  final LoginData loginForm = LoginData();

  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    loginFormKey.currentState!.save();
    
    try {
      final LoginResponseData res = await Api.instance.login(loginForm);
      res.saveLoginResponseData(res);
      logger.i(res.token);
      Global.saveToken(res.token ?? "null");
      Get.back(); // Assuming we navigate back after login, or to Home
    } catch (e) {
      logger.e("Login failed: $e");
      // Handle error (show toast etc.)
    }
  }
}
