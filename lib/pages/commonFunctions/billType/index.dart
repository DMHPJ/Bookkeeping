import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/billTypeListItem/index.dart';
import 'package:flutter_application_1/components/bottomButton/index.dart';
import 'package:flutter_application_1/pages/commonFunctions/billType/model.dart';
import 'package:flutter_application_1/repository/data/bill_type_list_data.dart';
import 'package:flutter_application_1/route/routes.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    Navigator.pushNamed(
      context,
      RoutePath.addEditBillType,
      arguments: data,
    ).then((value) => billTypeModel.getBillTypeList(_tabController.index));
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
                indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.all(Radius.circular(99.r)),
                  borderSide: BorderSide(
                    color: Color(0xFF1c1c22), // 指示器颜色
                    width: 75.h, // 指示器厚度
                  ),
                ),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: TextStyle(
                  fontSize: 36.r,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFECECEC),
                ),
                tabAlignment: TabAlignment.center,
                labelPadding: EdgeInsets.only(
                  right: 30.w,
                  left: 30.w,
                  top: 10.h,
                  bottom: 10.h,
                ),
              ),
            ],
          ),
          centerTitle: true,
          toolbarHeight: 160.h,
          surfaceTintColor: Color(0xffAFC8DA),
          backgroundColor: Color(0xffAFC8DA),
        ),
        body: Column(
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
                        SizedBox(height: 170.h),
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
    );
  }
}
