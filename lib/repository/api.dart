import 'package:dio/dio.dart';
import 'package:flutter_application_1/http/dio_instance.dart';
import 'package:flutter_application_1/repository/data/bill_chr_list_data.dart';
import 'package:flutter_application_1/repository/data/bill_main_info_data.dart';
import 'package:flutter_application_1/repository/data/bill_type_list_data.dart';
import 'package:flutter_application_1/repository/data/wallet_type_list_data.dart';

class Filter {
  
}

class Api {
  static Api instance = Api._();
  
  Api._();

  Future<List<BillChrItemData>?> getBillChrList() async {
    Response response = await DioInstance.instance().post(path: "/billChr/list");
    BillChrListData billChrListData = BillChrListData.fromJson(response.data);
    return billChrListData.data;
  }

  Future<BillMainInfoData?> getBillMainInfo() async {
    Response response = await DioInstance.instance().post(path: "/bill/info");
    BillMainInfoData billMainInfoData = BillMainInfoData.fromJson(response.data);
    return billMainInfoData;
  }


  // 收支类型
  Future<List<BillTypeItemData>?> getBillTypeList(int isIncome) async {
    final data = BillTypeItemData(isIncome: isIncome);
    Response response = await DioInstance.instance().post(path: "/type/list", data: data.toJson());
    BillTypeListData billTypeListData = BillTypeListData.fromJson(response.data);
    return billTypeListData.data;
  }
  // // 新增收支类型
  // Future<String> addBillType(BillTypeItemData billTypeItemData) async {
  //   Response response = await DioInstance.instance().post(path: "/type/add", data: billTypeItemData.toJson());
  //   return response.data;
  // }
  // 增改收支类型
  Future<String> updateBillType(BillTypeItemData billTypeItemData) async {
    Response response = await DioInstance.instance().post(path: "/type/addUpdate", data: billTypeItemData.toJson());
    return response.data;
  }

  // 资产类型
  Future<List<WalletTypeItemData>?> getWalletTypeList(int assetType) async {
    final data = WalletTypeItemData(assetType: assetType);
    Response response = await DioInstance.instance().post(path: "/walletType/list", data: data.toJson());
    WalletTypeListData walletTypeListData = WalletTypeListData.fromJson(response.data);
    return walletTypeListData.data;
  }
}