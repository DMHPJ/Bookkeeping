import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/api.dart';
import 'package:flutter_application_1/repository/data/bill_type_list_data.dart';

class BillTypeModel with ChangeNotifier {
  List<BillTypeItemData>? allBillTypeData;

  Future getBillTypeList(int isIncome) async {
    List<BillTypeItemData>? data = await Api.instance.getBillTypeList(isIncome);
    allBillTypeData = (data ?? []) as List<BillTypeItemData>?;
    notifyListeners();
    return allBillTypeData;
  }
}
