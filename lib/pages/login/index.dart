import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/api.dart';
import 'package:flutter_application_1/repository/data/login_data.dart';
import 'package:flutter_application_1/repository/data/login_response_data.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget { 
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final logger = Logger();
  final _loginFormKey = GlobalKey<FormState>();
  late LoginData loginForm;

  Future toAddUpdateType() async {
    final LoginResponseData res = await Api.instance.login(loginForm);
    res.saveLoginResponseData(res);
    Get.back();
  }

  void validForm() {
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();
      toAddUpdateType();
      logger.i(loginForm);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('Login Page'),
      ),
    );
  }
}