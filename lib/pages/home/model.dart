import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/api.dart';
import 'package:flutter_application_1/repository/data/bill_main_info_data.dart';

class HomePageModel with ChangeNotifier {
  BillMainInfoData? billMainInfoData;

  Future getBillMainInfo() async {
    BillMainInfoData? info = await Api.instance.getBillMainInfo();
    billMainInfoData = (info ?? {}) as BillMainInfoData?;
    notifyListeners();
    return billMainInfoData;
  }
}
