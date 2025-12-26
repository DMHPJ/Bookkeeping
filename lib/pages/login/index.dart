import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/GradientMainBox/gradient_main_box.dart';
import 'package:flutter_application_1/theme/app_colors.dart';
import 'package:flutter_application_1/utils/getSvg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return GradientMainBox(
      title: "",
      showBackButton: false,
      body: Form(
        key: controller.loginFormKey,
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
                          color: AppColors.shadowBlue,
                          offset: Offset(0.r, 0.r),
                          spreadRadius: 4.r,
                          blurRadius: 8.r,
                        ),
                      ],
                    ),
                    child: GetSvg.url(
                      "basic/user",
                      props: BasicSvgProps(color: AppColors.iconGray),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "账号",
                      filled: true,
                      fillColor: AppColors.inputFill,
                      contentPadding: EdgeInsets.only(
                        left: 24.w,
                        right: 16.w,
                        top: 16.h,
                        bottom: 16.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(99.r),
                        borderSide: BorderSide.none,
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
                    onSaved: (value) => controller.loginForm.username = value,
                  ),
                  SizedBox(height: 12.h),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "密码",
                      filled: true,
                      fillColor: AppColors.inputFillLight,
                      contentPadding: EdgeInsets.only(
                        left: 24.w,
                        right: 16.w,
                        top: 16.h,
                        bottom: 16.h,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(99.r),
                        borderSide: BorderSide.none,
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
                    onSaved: (value) => controller.loginForm.password = value,
                  ),
                  SizedBox(height: 8.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "当账号不存在时，将自动创建账号",
                      style: TextStyle(
                        fontSize: 12.r,
                        color: AppColors.textGray,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  MaterialButton(
                    onPressed: controller.login,
                    minWidth: double.infinity,
                    height: 46.h,
                    color: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(23.r)),
                    ),
                    child: Text(
                      "登录",
                      style: TextStyle(
                        fontSize: 16.r,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
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
