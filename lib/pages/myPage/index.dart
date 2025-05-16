import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/commonFunctions/billType/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

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

  void toSelectedPage(int index) {
    final routeName = commonFunctionList[index]["url"]!;

    switch (routeName) {
      case "billType":
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const BillType(),
          withNavBar: false,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我的")),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 35.w, right: 35.w),
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("常用功能"),
                    SizedBox(
                      height: 545.h,
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: commonFunctionList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // 列数
                          mainAxisSpacing: 30.h, // 主轴间距
                          crossAxisSpacing: 35.w, // 次轴间距
                          childAspectRatio: 1.4, // 宽高比例
                        ),
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                            onPressed: () => toSelectedPage(index), // 添加按钮点击事件
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              side: BorderSide.none,
                              backgroundColor:
                                  Colors.deepOrange.shade50, // 背景颜色
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60.r), // 圆角
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$index"),
                                Text(commonFunctionList[index]["name"]!),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
