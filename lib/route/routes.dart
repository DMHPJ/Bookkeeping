// 路由注册
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bill/index.dart';
import 'package:flutter_application_1/pages/commonFunctions/billType/index.dart';
import 'package:flutter_application_1/pages/home/index.dart';
import 'package:flutter_application_1/pages/myPage/index.dart';
import 'package:flutter_application_1/pages/report/index.dart';

class Routes {
  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(HomePage());
        case RoutePath.bill:
        return pageRoute(Bill());
        case RoutePath.report:
        return pageRoute(Report());
        case RoutePath.myPage:
        return pageRoute(MyPage());
      case RoutePath.billType:
        return pageRoute(BillType());
    }
    return pageRoute(
      Scaffold(body: SafeArea(child: Center(child: Text('404')))),
    );
  }

  static MaterialPageRoute pageRoute(
    final Widget page, {
    final bool? fullscreenDialog = false,
    final bool? maintainState = true,
    final RouteSettings? settings,
    final bool? allowSnapshotting = true,
  }) => MaterialPageRoute(builder: (_) => page);
}

// 路由树
class RoutePath {
  // 首页
  static const String home = '/home';
  // 账单
  static const String bill = '/bill';
  // 报表
  static const String report = '/report';
  // 我的
  static const String myPage = '/myPage';

  // 常用功能 - 收支类型
  static const String billType = '/commonFunctions/billType';
}
