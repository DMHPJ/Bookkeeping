import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/walletTypeListItem/index.dart';
import 'package:flutter_application_1/pages/commonFunctions/walletType/model.dart';
import 'package:flutter_application_1/repository/data/wallet_type_list_data.dart';
import 'package:flutter_application_1/route/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class WalletType extends StatefulWidget {
  const WalletType({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WalletTypeState();
  }
}

class _WalletTypeState extends State<WalletType>
    with SingleTickerProviderStateMixin {
  WalletTypeModel walletTypeModel = WalletTypeModel();
  late final TabController _tabController = TabController(
    length: 4,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    walletTypeModel.getBillTypeList(0);
  }

  void handleTabChange(int index) {
    walletTypeModel.getBillTypeList(_tabController.index);
  }

  void navigateToAddEdit(WalletTypeItemData data) {
    Get.toNamed(RoutePath.addEditFund, arguments: data);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WalletTypeModel>(
      create: (context) => walletTypeModel,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TabBar(
                controller: _tabController,
                tabs: [Text("资金"), Text("投资"), Text("应付"), Text("应收")],
                isScrollable: true,
                onTap: (value) => handleTabChange(value),
                dividerHeight: 0,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                labelStyle: TextStyle(
                  fontSize: 14.r,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFFFF),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Color(0xFF2965FF),
                  borderRadius: BorderRadius.all(Radius.circular(99.r)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(41, 101, 255, 0.16),
                      offset: Offset(0.r, 0.r),
                      spreadRadius: 4.r,
                      blurRadius: 8.r,
                    ),
                  ],
                ),
                tabAlignment: TabAlignment.center,
                labelPadding: EdgeInsets.only(
                  right: 18.w,
                  left: 18.w,
                  top: 6.h,
                  bottom: 6.h,
                ),
              ),
            ],
          ),
          centerTitle: true,
          toolbarHeight: 72.h,
          surfaceTintColor: Color(0xFFF2F8FF),
          backgroundColor: Color(0xFFF2F8FF),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFF2F8FF), Color(0xFFF9F9F9)],
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Consumer<WalletTypeModel>(
                        builder:
                            (context, value, child) => ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: value.walletTypeListData?.length ?? 0,
                              itemBuilder:
                                  (context, index) => InkWell(
                                    onTap:
                                        () => navigateToAddEdit(
                                          value.walletTypeListData![index],
                                        ),
                                    child: WalletTypeListItem(
                                      data: value.walletTypeListData![index],
                                    ),
                                  ),
                            ),
                      ),
                      SizedBox(height: 80.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
