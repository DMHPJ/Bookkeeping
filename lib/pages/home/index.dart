import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/billItem/bill_item.dart';
import 'package:flutter_application_1/components/walletItem/wallet_item.dart';
import 'package:flutter_application_1/pages/home/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageModel>(
      create: (context) => homePageModel,
      child: Scaffold(
        backgroundColor: Color(0xffFEFFFF),
        appBar: AppBar(
          title: Center(child: Text("首页")),
          toolbarHeight: 160.h,
          surfaceTintColor: Color(0xffAFC8DA),
          backgroundColor: Color(0xffAFC8DA),
        ),
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 500.h,
                  width: 1080.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.r),
                      bottomRight: Radius.circular(50.r),
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
                                    top: 80.h,
                                    bottom: 45.h,
                                    left: 35.h,
                                    right: 35.h,
                                  ),
                                  color: Color(0xffAFC8DA),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "本月支出（元）",
                                        style: TextStyle(fontSize: 34.r),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "￥${numberFormat.format(double.parse(homePageModel.billMainInfoData?.monthlyExpense ?? "0.0"))}",
                                            style: TextStyle(
                                              fontSize: 90.r,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Icon(Icons.remove_red_eye),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "本月收入 ${numberFormat.format(double.parse(homePageModel.billMainInfoData?.monthlyIncome ?? "0.0"))}",
                                              style: TextStyle(fontSize: 34.r),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "月结余 ${numberFormat.format(double.parse(homePageModel.billMainInfoData?.monthlyBalance ?? "0.0"))}",
                                              style: TextStyle(fontSize: 34.r),
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
                                    top: 80.h,
                                    bottom: 45.h,
                                    left: 35.h,
                                    right: 35.h,
                                  ),
                                  color: Color(0xffAFC8DA),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "净资产（元）",
                                        style: TextStyle(fontSize: 34.r),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "￥${numberFormat.format(double.parse(homePageModel.billMainInfoData?.netAsset ?? "0.0"))}",
                                            style: TextStyle(
                                              fontSize: 90.r,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Icon(Icons.remove_red_eye),
                                        ],
                                      ),
                                      SizedBox(height: 20.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "总资产 ${numberFormat.format(double.parse(homePageModel.billMainInfoData?.totalAsset ?? "0.0"))}",
                                              style: TextStyle(fontSize: 34.r),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "总负债 ${numberFormat.format(double.parse(homePageModel.billMainInfoData?.totalLiability ?? "0.0"))}",
                                              style: TextStyle(fontSize: 34.r),
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
                  padding: EdgeInsets.all(35.r),
                  child: Column(
                    children: [
                      if (_currentIndex == 0) ...[
                        Container(
                          margin: EdgeInsets.only(bottom: 20.h),
                          child: MaterialButton(
                            onPressed: () => {},
                            minWidth: double.infinity,
                            height: 100.h,
                            color: Color(0xffAFC8DA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.r),
                              ),
                            ),
                            child: Text(
                              "记一笔",
                              style: TextStyle(fontSize: 40.r),
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
                                  fontSize: 40.r,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () => {},
                                color: Color(0xffAFC8DA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.r),
                                  ),
                                ),
                                child: Text(
                                  "按时间",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35.r,
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
                          margin: EdgeInsets.only(bottom: 20.h),
                          child: MaterialButton(
                            onPressed: () => {},
                            minWidth: double.infinity,
                            height: 100.h,
                            color: Color(0xffAFC8DA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.r),
                              ),
                            ),
                            child: Text(
                              "添加资产",
                              style: TextStyle(fontSize: 40.r),
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
                                  fontSize: 40.r,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () => {},
                                color: Color(0xffAFC8DA),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.r),
                                  ),
                                ),
                                child: Text(
                                  "占位",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35.r,
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
    );
  }
}
