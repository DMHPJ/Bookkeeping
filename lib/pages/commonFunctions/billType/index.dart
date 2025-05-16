import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/billTypeListItem/index.dart';
import 'package:flutter_application_1/pages/commonFunctions/billType/model.dart';
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
  BillTypeModel billTypeModel = BillTypeModel();

  @override
  void initState() {
    super.initState();
    billTypeModel.getAllBillType();
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
        body: SingleChildScrollView(
          child: Consumer<BillTypeModel>(
            builder:
                (context, value, child) => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: value.allBillTypeData?.length ?? 0,
                  itemBuilder:
                      (context, index) =>
                          BillTypeListItem(data: value.allBillTypeData?[index]),
                ),
          ),
        ),
      ),
    );
  }
}
