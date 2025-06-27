import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/billItem/bill_item.dart';
import 'package:flutter_application_1/components/walletItem/wallet_item.dart';
import 'package:flutter_application_1/pages/commonFunctions/walletType/index.dart';
import 'package:flutter_application_1/pages/home/model.dart';
import 'package:flutter_application_1/route/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

final numberFormat = NumberFormat("##,##0.00", "en_US");

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  HomePageModel homePageModel = HomePageModel();

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    homePageModel.getBillMainInfo();
  }

  void toAddWallet() {
    Get.toNamed(RoutePath.walletType);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageModel>(
      create: (context) => homePageModel,
      child: Scaffold(
        backgroundColor: Color(0xffF9F9F9),
        appBar: AppBar(
          title: Center(child: Text("首页")),
          toolbarHeight: 42.h,
          surfaceTintColor: Color(0xFFD7E4FF),
          backgroundColor: Color(0xFFD7E4FF),
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFF2F8FF), Color(0xFFF9F9F9)],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 160.h,
                    width: 375.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                      ),
                      child: Swiper(
                        loop: false,
                        itemCount: 2,
                        index: _currentIndex,
                        onIndexChanged:
                            (value) => {
                              setState(() {
                                _currentIndex = value;
                              }),
                            },
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Consumer<HomePageModel>(
                              builder:
                                  (context, value, child) => Container(
                                    padding: EdgeInsets.only(
                                      top: 8.h,
                                      left: 16.w,
                                      right: 16.w,
                                    ),
                                    color: Color(0xFFD7E4FF),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "本月支出（元）",
                                          style: TextStyle(fontSize: 14.r),
                                        ),
                                        SizedBox(height: 6.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "￥${numberFormat.format(double.parse(homePageModel.billMainInfoData?.monthlyExpense ?? "0.0"))}",
                                              style: TextStyle(
                                                fontSize: 32.r,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Icon(Icons.remove_red_eye),
                                          ],
                                        ),
                                        SizedBox(height: 12.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                textBaseline:
                                                    TextBaseline.alphabetic,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.baseline,
                                                children: [
                                                  Text(
                                                    "本月收入",
                                                    style: TextStyle(
                                                      fontSize: 14.r,
                                                    ),
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Text(
                                                    numberFormat.format(
                                                      double.parse(
                                                        homePageModel
                                                                .billMainInfoData
                                                                ?.monthlyIncome ??
                                                            "0.0",
                                                      ),
                                                    ),
                                                    style: TextStyle(
                                                      fontSize: 14.r,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                textBaseline:
                                                    TextBaseline.alphabetic,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.baseline,
                                                children: [
                                                  Text(
                                                    "月结余",
                                                    style: TextStyle(
                                                      fontSize: 14.r,
                                                    ),
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Text(
                                                    numberFormat.format(
                                                      double.parse(
                                                        homePageModel
                                                                .billMainInfoData
                                                                ?.monthlyBalance ??
                                                            "0.0",
                                                      ),
                                                    ),
                                                    style: TextStyle(
                                                      fontSize: 14.r,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                            );
                          } else {
                            return Consumer<HomePageModel>(
                              builder:
                                  (context, value, child) => Container(
                                    padding: EdgeInsets.only(
                                      top: 8.h,
                                      left: 16.w,
                                      right: 16.w,
                                    ),
                                    color: Color(0xFFD7E4FF),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "净资产（元）",
                                          style: TextStyle(fontSize: 14.r),
                                        ),
                                        SizedBox(height: 6.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "￥${numberFormat.format(double.parse(homePageModel.billMainInfoData?.netAsset ?? "0.0"))}",
                                              style: TextStyle(
                                                fontSize: 32.r,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Icon(Icons.remove_red_eye),
                                          ],
                                        ),
                                        SizedBox(height: 12.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                textBaseline:
                                                    TextBaseline.alphabetic,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.baseline,
                                                children: [
                                                  Text(
                                                    "总资产",
                                                    style: TextStyle(
                                                      fontSize: 14.r,
                                                    ),
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Text(
                                                    numberFormat.format(
                                                      double.parse(
                                                        homePageModel
                                                                .billMainInfoData
                                                                ?.totalAsset ??
                                                            "0.0",
                                                      ),
                                                    ),
                                                    style: TextStyle(
                                                      fontSize: 14.r,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                textBaseline:
                                                    TextBaseline.alphabetic,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.baseline,
                                                children: [
                                                  Text(
                                                    "总负债",
                                                    style: TextStyle(
                                                      fontSize: 14.r,
                                                    ),
                                                  ),
                                                  SizedBox(width: 4.w),
                                                  Text(
                                                    numberFormat.format(
                                                      double.parse(
                                                        homePageModel
                                                                .billMainInfoData
                                                                ?.totalLiability ??
                                                            "0.0",
                                                      ),
                                                    ),
                                                    style: TextStyle(
                                                      fontSize: 14.r,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                            );
                          }
                        },
                        pagination: const SwiperPagination(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(16.r),
                    child: Column(
                      children: [
                        if (_currentIndex == 0) ...[
                          Container(
                            margin: EdgeInsets.only(bottom: 16.h),
                            child: MaterialButton(
                              onPressed: () => {},
                              minWidth: double.infinity,
                              height: 36.h,
                              color: Color(0xFFABC3FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32.r),
                                ),
                              ),
                              child: Text(
                                "记一笔",
                                style: TextStyle(
                                  fontSize: 16.r,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "近3日账单",
                                  style: TextStyle(
                                    fontSize: 16.r,
                                    color: Color(0xff333333),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () => {},
                                  color: Color(0xFFABC3FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30.r),
                                    ),
                                  ),
                                  child: Text(
                                    "按时间",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.r,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Consumer<HomePageModel>(
                            builder:
                                (context, value, child) => ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      value
                                          .billMainInfoData
                                          ?.billChrList
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (context, index) => BillItem(
                                        data:
                                            value
                                                .billMainInfoData
                                                ?.billChrList?[index],
                                      ),
                                ),
                          ),
                        ] else ...[
                          Container(
                            margin: EdgeInsets.only(bottom: 16.h),
                            child: MaterialButton(
                              onPressed: toAddWallet,
                              minWidth: double.infinity,
                              height: 36.h,
                              color: Color(0xFFABC3FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32.r),
                                ),
                              ),
                              child: Text(
                                "添加资产",
                                style: TextStyle(
                                  fontSize: 16.r,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "资产",
                                  style: TextStyle(
                                    fontSize: 16.r,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () => {},
                                  color: Color(0xFFABC3FF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(32.r),
                                    ),
                                  ),
                                  child: Text(
                                    "占位",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.r,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Consumer<HomePageModel>(
                            builder:
                                (context, value, child) => ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount:
                                      value
                                          .billMainInfoData
                                          ?.walletList
                                          ?.length ??
                                      0,
                                  itemBuilder:
                                      (context, index) => WalletItem(
                                        data:
                                            value
                                                .billMainInfoData
                                                ?.walletList?[index],
                                      ),
                                ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
