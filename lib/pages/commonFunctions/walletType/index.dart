import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/walletTypeListItem/index.dart';
import 'package:flutter_application_1/pages/commonFunctions/walletType/model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<WalletTypeModel>(
                builder:
                    (context, value, child) => ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: value.walletTypeListData?.length ?? 0,
                      itemBuilder:
                          (context, index) => WalletTypeListItem(
                            data: value.walletTypeListData![index],
                          ),
                    ),
              ),
              SizedBox(height: 170.h),
            ],
          ),
        ),
      ),
    );
  }
}
