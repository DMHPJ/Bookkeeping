import 'package:flutter_application_1/repository/data/bill_chr_list_data.dart';
import 'package:flutter_application_1/repository/data/wallet_list_data.dart';

class BillMainInfoData {
  BillMainInfoData({
      this.id, 
      this.tenant, 
      this.totalAsset, 
      this.netAsset, 
      this.totalLiability, 
      this.monthlyExpense, 
      this.monthlyIncome, 
      this.monthlyBalance, 
      this.createTime, 
      this.updateTime, 
      this.billChrList, 
      this.walletList,});

  BillMainInfoData.fromJson(dynamic json) {
    id = json['id'];
    tenant = json['tenant'];
    totalAsset = json['totalAsset'];
    netAsset = json['netAsset'];
    totalLiability = json['totalLiability'];
    monthlyExpense = json['monthlyExpense'];
    monthlyIncome = json['monthlyIncome'];
    monthlyBalance = json['monthlyBalance'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
    if (json['billChrList'] != null) {
      billChrList = [];
      json['billChrList'].forEach((v) {
        billChrList?.add(BillChrItemData.fromJson(v));
      });
    }
    if (json['walletList'] != null) {
      walletList = [];
      json['walletList'].forEach((v) {
        walletList?.add(WalletItemData.fromJson(v));
      });
    }
  }
  String? id;
  String? tenant;
  String? totalAsset;
  String? netAsset;
  String? totalLiability;
  String? monthlyExpense;
  String? monthlyIncome;
  String? monthlyBalance;
  String? createTime;
  String? updateTime;
  List<BillChrItemData>? billChrList;
  List<WalletItemData>? walletList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['tenant'] = tenant;
    map['totalAsset'] = totalAsset;
    map['netAsset'] = netAsset;
    map['totalLiability'] = totalLiability;
    map['monthlyExpense'] = monthlyExpense;
    map['monthlyIncome'] = monthlyIncome;
    map['monthlyBalance'] = monthlyBalance;
    map['createTime'] = createTime;
    map['updateTime'] = updateTime;
    if (billChrList != null) {
      map['billChrList'] = billChrList?.map((v) => v.toJson()).toList();
    }
    if (walletList != null) {
      map['walletList'] = walletList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}