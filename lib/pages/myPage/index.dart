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
      appBar: AppBar(
        title: Text("我的"),
        centerTitle: true,
        surfaceTintColor: Color(0xFFF2F8FF),
        backgroundColor: Color(0xFFF2F8FF),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFF2F8FF), Color(0xFFF9F9F9)],
            ),
          ),
          child: Column(
            children: [
              Container(
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
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.r),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(41, 101, 255, 0.06),
                                offset: Offset(0.r, 0.r),
                                spreadRadius: 4.r,
                                blurRadius: 8.r,
                              ),
                            ],
                          ),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text("占"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("阿七七", style: TextStyle(fontSize: 20.r, fontWeight: FontWeight.w500)),
                            SizedBox(height: 8.h),
                            Text("ID: 1234567890", style: TextStyle(fontSize: 12.r, fontWeight: FontWeight.w500)),
                          ],
                        ),
                        Spacer(),
                        Container(
                          width: 32.h,
                          height: 32.w,
                          decoration: BoxDecoration(
                            color: Color(0xFFF8F8F8),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50.r),
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text("占"),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 26.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [Text("收支")],
                        ),
                        Column(
                          children: [Text("账单")],
                        ),
                        Column(
                          children: [Text("资产")],
                        )
                      ],
                    )
                  ],
                ),
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text("常用功能"),
                //     SizedBox(
                //       height: 545.h,
                //       width: double.infinity,
                //       child: GridView.builder(
                //         itemCount: commonFunctionList.length,
                //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //           crossAxisCount: 4, // 列数
                //           mainAxisSpacing: 30.h, // 主轴间距
                //           crossAxisSpacing: 35.w, // 次轴间距
                //           childAspectRatio: 1.4, // 宽高比例
                //         ),
                //         itemBuilder: (context, index) {
                //           return ElevatedButton(
                //             onPressed: () => toSelectedPage(index), // 添加按钮点击事件
                //             style: ElevatedButton.styleFrom(
                //               elevation: 0,
                //               side: BorderSide.none,
                //               backgroundColor:
                //                   Colors.deepOrange.shade50, // 背景颜色
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(60.r), // 圆角
                //               ),
                //             ),
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Text("$index"),
                //                 Text(commonFunctionList[index]["name"]!),
                //               ],
                //             ),
                //           );
                //         },
                //       ),
                //     ),
                //   ],
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
