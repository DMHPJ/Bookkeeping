import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/GradientMainBox/gradient_main_box.dart';
import 'package:flutter_application_1/pages/commonFunctions/billType/index.dart';
import 'package:flutter_application_1/route/routes.dart';
import 'package:flutter_application_1/utils/getSvg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyPage extends StatefulWidget {
  final String info;
  const MyPage({super.key, this.info = "返回"});

  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> {
  final myController = TextEditingController();

  final commonFunctionList = [
    {"name": "收支分类", "icon": "占", "url": "billType"},
    {"name": "资产", "icon": "占", "url": ""},
    {"name": "多账本", "icon": "占", "url": "multipleLedger"},
    {"name": "预算设置", "icon": "占", "url": "budgetSetting"},
    {"name": "标签", "icon": "占", "url": "billType"},
    {"name": "定时记账", "icon": "占", "url": "timedAccounting"},
    {"name": "账单管理", "icon": "占", "url": "billManage"},
    {"name": "账单报告", "icon": "占", "url": "billReport"},
    {"name": "汇率", "icon": "占", "url": "exchangeRate"},
    {"name": "存钱", "icon": "占", "url": "saveMoney"},
    {"name": "购物清单", "icon": "占", "url": "shoppingList"},
  ];

  void toSelectedPage(String pageName) {
    switch (pageName) {
      case "billType":
        Get.toNamed(RoutePath.billType);
        break;
      default:
        break;
    }
  }

  Widget inkWellItem(String pageName, String title) => InkWell(
    onTap: () => toSelectedPage(pageName), // 添加按钮点击事件
    child: Column(
      children: [
        Container(
          width: 24.h,
          height: 24.w,
          margin: EdgeInsets.only(bottom: 10.h),
          child: GetSvg.url(
            "basic/$pageName",
            props: BasicSvgProps(color: Color(0xFF2965FF)),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 14.r,
            fontWeight: FontWeight.w500,
            color: Color(0xFF333333),
          ),
        ),
      ],
    ),
  );

  Widget inkWellListItem(String iconName, String title) => Container(
    padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
    child: Row(
      children: [
        Container(
          width: 14.w,
          height: 14.h,
          margin: EdgeInsets.only(right: 12.w),
          child: GetSvg.url(
            "basic/$iconName",
            props: BasicSvgProps(color: Color(0xFF2965FF)),
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 14.r, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        Icon(Icons.chevron_right_rounded, size: 14.r, color: Color(0xFF2965FF)),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GradientMainBox(
      title: "我的",
      body: Container(
        margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16.h),
              padding: EdgeInsets.only(
                top: 24.h,
                bottom: 20.h,
                left: 16.w,
                right: 16.w,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(41, 101, 255, 0.06),
                    offset: Offset(0.r, 0.r),
                    spreadRadius: 4.r,
                    blurRadius: 8.r,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 68.h,
                        height: 68.w,
                        margin: EdgeInsets.only(right: 16.w),
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50.r)),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "用户名",
                            style: TextStyle(
                              fontSize: 20.r,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "ID: 1234567890",
                            style: TextStyle(
                              fontSize: 12.r,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 32.h,
                        height: 32.w,
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F8F8),
                          borderRadius: BorderRadius.all(Radius.circular(50.r)),
                        ),
                        child: GetSvg.url(
                          "basic/setting",
                          props: BasicSvgProps(color: Color(0xFF333333)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 26.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      inkWellItem("billType", "收支"),
                      inkWellItem("bill", "账单"),
                      inkWellItem("wallet", "资产"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.h),
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: Column(
                children: [
                  inkWellListItem("saveMoney", "存钱"),
                  inkWellListItem("timedAccounting", "定时记账"),
                  inkWellListItem("timedAccounting", "定时记账"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.h),
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: Column(
                children: [
                  inkWellListItem("saveMoney", "存钱"),
                  inkWellListItem("timedAccounting", "定时记账"),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(41, 101, 255, 0.06),
                    offset: Offset(0.r, 0.r),
                    spreadRadius: 4.r,
                    blurRadius: 8.r,
                  ),
                ],
              ),
              child: Column(
                children: [inkWellListItem("timedAccounting", "定时记账")],
              ),
            ),
            Text("唯一识别码")
          ],
        ),
      ),
    );
  }
}
