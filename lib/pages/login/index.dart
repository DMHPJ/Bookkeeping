import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/GradientMainBox/gradient_main_box.dart';
import 'package:flutter_application_1/repository/api.dart';
import 'package:flutter_application_1/repository/appSettings.dart';
import 'package:flutter_application_1/repository/data/login_data.dart';
import 'package:flutter_application_1/repository/data/login_response_data.dart';
import 'package:flutter_application_1/utils/getSvg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  LoginData loginForm = LoginData();

  Future toAddUpdateType() async {
    final LoginResponseData res = await Api.instance.login(loginForm);
    res.saveLoginResponseData(res);
    logger.i(res.token);
    Global.saveToken(res.token ?? "null");
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
    return GradientMainBox(
      title: "",
      showBackButton: false,
      body: Form(
        key: _loginFormKey,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 112.h),
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                  Container(
                    width: 124.h,
                    height: 124.w,
                    margin: EdgeInsets.only(right: 16.w),
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(99.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(41, 101, 255, 0.06),
                          offset: Offset(0.r, 0.r),
                          spreadRadius: 4.r,
                          blurRadius: 8.r,
                        ),
                      ],
                    ),
                    child: GetSvg.url(
                      "basic/user",
                      props: BasicSvgProps(color: Color(0xFF999999)),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "账号",
                      filled: true, // 填充背景颜色
                      fillColor: Color(0xFFEEEEEE),
                      contentPadding: EdgeInsets.only(
                        left: 24.w,
                        right: 16.w,
                        top: 16.h,
                        bottom: 16.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(99.r), // 设置圆角
                        borderSide: BorderSide.none, // 去掉边框
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(99.r),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(99.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入账号';
                      }
                      return null;
                    },
                    onSaved: (value) => loginForm.username = value,
                  ),
                  SizedBox(height: 12.h),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "密码",
                      filled: true, // 填充背景颜色
                      fillColor: Color(0xFFF2F2F2),
                      contentPadding: EdgeInsets.only(
                        left: 24.w,
                        right: 16.w,
                        top: 16.h,
                        bottom: 16.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(99.r), // 设置圆角
                        borderSide: BorderSide.none, // 去掉边框
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(99.r),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(99.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '请输入密码';
                      }
                      return null;
                    },
                    onSaved: (value) => loginForm.password = value,
                  ),
                  SizedBox(height: 8.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "当账号不存在时，将自动创建账号",
                      style: TextStyle(
                        fontSize: 12.r,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  MaterialButton(
                    onPressed: validForm,
                    minWidth: double.infinity,
                    height: 46.h,
                    color: Color(0xff2965FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(23.r)),
                    ),
                    child: Text(
                      "登录",
                      style: TextStyle(
                        fontSize: 16.r,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
