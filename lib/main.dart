import 'package:flutter/material.dart';
import 'package:flutter_application_1/http/dio_instance.dart';
import 'package:flutter_application_1/pages/tabbar/index.dart';
import 'package:flutter_application_1/repository/appSettings.dart';
import 'package:flutter_application_1/route/routes.dart';
import 'package:flutter_application_1/utils/globalTheme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  DioInstance.instance().initDio(baseUrl: Environment.apiUrl);
  runApp(const MyApp());
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
            (materialAppContext, child) => MaterialApp(
              title: 'Flutter Demo',
              theme: GlobalTheme.themeData(),
              // initialRoute: RoutePath.home,
              home: MyTabBar(menuScreenContext: materialAppContext),
              onGenerateRoute: Routes.generateRoute,
            ),
      ),
    );
  }
}
