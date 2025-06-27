import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/billTypeListItem/index.dart';
import 'package:flutter_application_1/components/bottomButton/index.dart';
import 'package:flutter_application_1/pages/commonFunctions/billType/model.dart';
import 'package:flutter_application_1/repository/data/bill_type_list_data.dart';
import 'package:flutter_application_1/route/routes.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BillType extends StatefulWidget {
  const BillType({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BillTypeState();
  }
}

class _BillTypeState extends State<BillType>
    with SingleTickerProviderStateMixin {
  final logger = Logger();
  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );
  BillTypeModel billTypeModel = BillTypeModel();

  @override
  void initState() {
    super.initState();
    billTypeModel.getBillTypeList(0);
  }

  void navigateToAddEdit(BillTypeItemData data) {
    Get.toNamed(
      RoutePath.addEditBillType,
      arguments: data,
    )?.then((value) => billTypeModel.getBillTypeList(_tabController.index));
  }

  void toAddBillMainType() {
    final newBillType = BillTypeItemData(isIncome: _tabController.index);
    navigateToAddEdit(newBillType);
  }

  void handleTabChange(int index) {
    billTypeModel.getBillTypeList(_tabController.index);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BillTypeModel>(
      create: (context) => billTypeModel,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TabBar(
                controller: _tabController,
                tabs: [Text("支出分类"), Text("收入分类")],
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
                  right: 36.w,
                  left: 36.w,
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
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Consumer<BillTypeModel>(
                            builder:
                                (context, value, child) => ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: value.allBillTypeData?.length ?? 0,
                                  itemBuilder:
                                      (context, index) => BillTypeListItem(
                                        data: value.allBillTypeData![index],
                                        navigateToAddEdit: navigateToAddEdit,
                                      ),
                                ),
                          ),
                          SizedBox(height: 80.h),
                        ],
                      ),
                    ),
                    BottomButton(
                      buttonText: "添加主类",
                      onPressed: toAddBillMainType,
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
