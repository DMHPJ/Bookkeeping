import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/api.dart';
import 'package:flutter_application_1/repository/data/bill_type_list_data.dart';

class BillTypeModel with ChangeNotifier {
  List<BillTypeItemData>? allBillTypeData;

  Future getAllBillType() async {
    List<BillTypeItemData>? data = await Api.instance.getAllBillTypeList();
    allBillTypeData = (data ?? []) as List<BillTypeItemData>?;
    notifyListeners();
    return allBillTypeData;
  }
}
