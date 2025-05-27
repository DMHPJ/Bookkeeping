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

class _BillTypeState extends State<BillType> {
  final logger = Logger();
  BillTypeModel billTypeModel = BillTypeModel();

  @override
  void initState() {
    super.initState();
    billTypeModel.getAllBillType();
  }

  void navigateToAddEdit(BillTypeItemData data){
    Navigator.pushNamed(
      context,
      RoutePath.addEditBillType,
      arguments: data,
    ).then((value) => billTypeModel.getAllBillType());
  }

  void toAddBillMainType() {
    final newBillType = BillTypeItemData(isIncome: 1);
    navigateToAddEdit(newBillType);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BillTypeModel>(
      create: (context) => billTypeModel,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(child: Text("支出分类")),
              SizedBox(width: 16.w),
              Container(child: Text("收入分类")),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
