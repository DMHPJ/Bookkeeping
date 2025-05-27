import 'package:flutter/material.dart';
import 'package:flutter_application_1/repository/api.dart';
import 'package:flutter_application_1/repository/data/wallet_type_list_data.dart';

class WalletTypeModel with ChangeNotifier {
  List<WalletTypeItemData>? walletTypeListData;

  Future getBillTypeList(int assetType) async {
    List<WalletTypeItemData>? data = await Api.instance.getWalletTypeList(assetType);
    walletTypeListData = (data ?? []) as List<WalletTypeItemData>?;
    notifyListeners();
    return walletTypeListData;
  }
}
