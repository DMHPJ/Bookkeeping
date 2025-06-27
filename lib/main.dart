import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/tabbar/index.dart';
import 'package:flutter_application_1/repository/appSettings.dart';
import 'package:flutter_application_1/route/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:get/get.dart';

void main() {
  Global.init().then((e) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder:
            (materialAppContext, child) => GetMaterialApp(
              title: 'Flutter Demo',
              theme: Global.globalTheme(),
              // initialRoute: RoutePath.home,
              home: MyTabBar(menuScreenContext: materialAppContext),
              getPages: AppPages.pages,
            ),
      ),
    );
  } 
}
