// 路由注册
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/bill/index.dart';
import 'package:flutter_application_1/pages/commonFunctions/walletType/index.dart';
import 'package:flutter_application_1/pages/commonFunctions/billType/index.dart';
import 'package:flutter_application_1/pages/commonFunctions/billType/subPage/editMainBillType.dart';
import 'package:flutter_application_1/pages/commonFunctions/walletType/subPage/addEditFund.dart';
import 'package:flutter_application_1/pages/home/index.dart';
import 'package:flutter_application_1/pages/login/index.dart';
import 'package:flutter_application_1/pages/myPage/index.dart';
import 'package:flutter_application_1/pages/report/index.dart';
import 'package:flutter_application_1/repository/data/bill_type_list_data.dart';
import 'package:flutter_application_1/repository/data/wallet_type_list_data.dart';
import 'package:get/get.dart';

class Routes {
  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.login:
        return pageRoute(LoginPage());
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
      case RoutePath.addEditBillType:
        final argument = settings.arguments as BillTypeItemData?;
        return pageRoute(EditMainBillType(argument: argument));
      case RoutePath.walletType:
        return pageRoute(WalletType());
      case RoutePath.addEditFund:
        final argument = settings.arguments as WalletTypeItemData?;
        return pageRoute(AddEditFund(argument: argument));
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
  // 登录
  static const String login = '/login/index';
  // 首页
  static const String home = '/home/index';
  // 账单
  static const String bill = '/bill/index';
  // 报表
  static const String report = '/report/index';
  // 我的
  static const String myPage = '/myPage/index';

  // 常用功能 - 收支类型
  static const String billType = '/commonFunctions/billType/index';
  // 常用功能 - 收支类型 - 添加主类
  static const String addEditBillType =
      '/commonFunctions/billType/subPage/addEditBillType';
  // 常用功能 - 资产类型
  static const String walletType = '/commonFunctions/walletType/index';
  // 常用功能 - 资产类型 - 增改资金类型账户
  static const String addEditFund =
      '/commonFunctions/walletType/subPage/addEditFund';
}

class AppPages {
  static final pages = [
    GetPage(name: RoutePath.login, page: () => LoginPage()),
    GetPage(name: RoutePath.home, page: () => HomePage()),
    GetPage(name: RoutePath.bill, page: () => Bill()),
    GetPage(name: RoutePath.report, page: () => Report()),
    GetPage(name: RoutePath.myPage, page: () => MyPage()),
    GetPage(name: RoutePath.billType, page: () => BillType()),
    GetPage(name: RoutePath.addEditBillType, page: () => EditMainBillType()),
    GetPage(name: RoutePath.walletType, page: () => WalletType()),
    GetPage(name: RoutePath.addEditFund, page: () => AddEditFund()),
  ];
}