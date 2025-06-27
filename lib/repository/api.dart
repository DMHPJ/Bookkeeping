import 'package:dio/dio.dart';
import 'package:flutter_application_1/http/base_model.dart';
import 'package:flutter_application_1/http/dio_instance.dart';
import 'package:flutter_application_1/repository/data/bill_chr_list_data.dart';
import 'package:flutter_application_1/repository/data/bill_main_info_data.dart';
import 'package:flutter_application_1/repository/data/bill_type_list_data.dart';
import 'package:flutter_application_1/repository/data/wallet_list_data.dart';
import 'package:flutter_application_1/repository/data/wallet_type_list_data.dart';
import 'package:logger/web.dart';

class Filter {}

class Api {
  static Api instance = Api._();
  final logger = Logger();

  Api._();

  Future<List<BillChrItemData>?> getBillChrList() async {
    Response response = await DioInstance.instance().post(
      path: "/billChr/list",
    );
    BillChrListData billChrListData;
    if(response.data?.data != null) {
    billChrListData = BillChrListData.fromJson(response.data.data);
    } else {
      billChrListData = BillChrListData();
    }
    return billChrListData.data;
  }

  Future<BillMainInfoData?> getBillMainInfo() async {
    Response response = await DioInstance.instance().post(path: "/bill/info");
    logger.i(response);
    BillMainInfoData billMainInfoData;
    if(response.data?.data != null) {
      billMainInfoData = BillMainInfoData.fromJson(response.data.data);
    } else {
      billMainInfoData = BillMainInfoData();
    }
    return billMainInfoData;
  }

  // 收支类型
  Future<List<BillTypeItemData>?> getBillTypeList(int isIncome) async {
    final data = BillTypeItemData(isIncome: isIncome);
    Response response = await DioInstance.instance().post(
      path: "/type/list",
      data: data.toJson(),
    );
    BillTypeListData billTypeListData; 
    if(response.data?.data != null) {
      billTypeListData = BillTypeListData.fromJson(response.data.data);
    } else {
      billTypeListData = BillTypeListData();
    }
    return billTypeListData.data;
  }

  // // 新增收支类型
  // Future<String> addBillType(BillTypeItemData billTypeItemData) async {
  //   Response response = await DioInstance.instance().post(path: "/type/add", data: billTypeItemData.toJson());
  //   return response.data;
  // }
  // 增改收支类型
  Future<String> updateBillType(BillTypeItemData billTypeItemData) async {
    Response response = await DioInstance.instance().post(
      path: "/type/addUpdate",
      data: billTypeItemData.toJson(),
    );
    return response.data?.msg ?? "未知异常";
  }

  // 资产类型
  Future<List<WalletTypeItemData>?> getWalletTypeList(int assetType) async {
    final data = WalletTypeItemData(assetType: assetType);
    Response response = await DioInstance.instance().post(
      path: "/walletType/list",
      data: data.toJson(),
    );
    WalletTypeListData walletTypeListData;
    if(response.data?.data != null) {
      walletTypeListData = WalletTypeListData.fromJson(response.data.data);
    } else {
      walletTypeListData = WalletTypeListData();
    }
    return walletTypeListData.data;
  }

  // 增改资产
  Future<String> updateWallet(WalletItemData walletItemData) async {
    Response response = await DioInstance.instance().post(
      path: "/wallet/addUpdate",
      data: walletItemData.toJson(),
    );
    return response.data?.msg  ?? "未知异常";
  }
}
