import 'package:dio/dio.dart';
import 'package:flutter_application_1/http/dio_instance.dart';
import 'package:flutter_application_1/repository/data/bill_chr_list_data.dart';
import 'package:flutter_application_1/repository/data/bill_main_info_data.dart';
import 'package:flutter_application_1/repository/data/bill_type_list_data.dart';

class Api {
  static Api instance = Api._();
  
  Api._();

  Future<List<BillChrItemData>?> getBillChrList() async {
    Response response = await DioInstance.instance().post(path: "/bill/chrList");
    BillChrListData billChrListData = BillChrListData.fromJson(response.data);
    return billChrListData.data;
  }

  Future<BillMainInfoData?> getBillMainInfo() async {
    Response response = await DioInstance.instance().post(path: "/bill");
    BillMainInfoData billMainInfoData = BillMainInfoData.fromJson(response.data);
    return billMainInfoData;
  }


  // 收支类型
  Future<List<BillTypeItemData>?> getAllBillTypeList() async {
    Response response = await DioInstance.instance().post(path: "/type/all");
    BillTypeListData billTypeListData = BillTypeListData.fromJson(response.data);
    return billTypeListData.data;
  }
  // 新增收支类型
  Future<String> addBillType(BillTypeItemData billTypeItemData) async {
    Response response = await DioInstance.instance().post(path: "/type/add", data: billTypeItemData.toJson());
    return response.data;
  }
  // 修改收支类型
  Future<String> updateBillType(BillTypeItemData billTypeItemData) async {
    Response response = await DioInstance.instance().post(path: "/type/update", data: billTypeItemData.toJson());
    return response.data;
  }
}