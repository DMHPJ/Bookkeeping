import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/billTypeListItem/iconIndex.dart';
import 'package:flutter_application_1/components/calculator/index.dart';
import 'package:flutter_application_1/pages/commonFunctions/billType/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/web.dart';
import 'package:provider/provider.dart';

class AddEditBillChr extends StatefulWidget {
  const AddEditBillChr({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddEditBillChrState();
  }
}

class _AddEditBillChrState extends State<AddEditBillChr>
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
                      padding: EdgeInsets.only(bottom: 240.h),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                            child: Consumer<BillTypeModel>(
                              builder:
                                  (context, value, child) => GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount:
                                        value.allBillTypeData?.length ?? 0,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 5, // 列数
                                          mainAxisSpacing: 16.h, // 主轴间距
                                          crossAxisSpacing: 12.w, // 次轴间距
                                          childAspectRatio: 0.8857, // 宽高比例
                                        ),
                                    itemBuilder:
                                        (context, index) =>
                                            BillTypeListItemIcon(
                                              data:
                                                  value.allBillTypeData![index],
                                            ),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Calculator(),
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
