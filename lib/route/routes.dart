// 路由注册
import 'package:flutter_application_1/pages/bill/index.dart';
import 'package:flutter_application_1/pages/bill/subPage/addEditBillchr.dart';
import 'package:flutter_application_1/pages/commonFunctions/billType/index.dart';
import 'package:flutter_application_1/pages/commonFunctions/billType/subPage/editMainBillType.dart';
import 'package:flutter_application_1/pages/commonFunctions/walletType/index.dart';
import 'package:flutter_application_1/pages/commonFunctions/walletType/subPage/addEditFund.dart';
import 'package:flutter_application_1/pages/home/index.dart';
import 'package:flutter_application_1/pages/login/index.dart';
import 'package:flutter_application_1/pages/myPage/index.dart';
import 'package:flutter_application_1/pages/report/index.dart';
import 'package:get/get.dart';

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
  // 账单 - 增改账单明细
  static const String addEditBillChr = '/bill/subPage/addEditBillChr';
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
    GetPage(name: RoutePath.addEditBillChr, page: () => AddEditBillChr()),
  ];
}
