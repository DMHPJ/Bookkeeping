class WalletListData {
  WalletListData({this.data});

  WalletListData.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(WalletItemData.fromJson(v));
      });
    }
  }

  List<WalletItemData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['WalletItemData'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class WalletItemData {
  WalletItemData({
    this.id,
    this.billId,
    this.walletType,
    this.walletTypeName,
    this.walletTypeIcon,
    this.walletName,
    this.walletAmount,
    this.showWallet,
    this.addCalculate,
    this.createTime,
    this.updateTime,
  });

  WalletItemData.fromJson(dynamic json) {
    id = json['id'];
    billId = json['billId'];
    walletType = json['walletType'];
    walletTypeName = json['walletTypeName'];
    walletTypeIcon = json['walletTypeIcon'];
    walletName = json['walletName'];
    walletAmount = json['walletAmount'];
    showWallet = json['showWallet'];
    addCalculate = json['addCalculate'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }
  String? id;
  String? billId;
  int? walletType;
  String? walletTypeName;
  String? walletTypeIcon;
  String? walletName;
  String? walletAmount;
  int? showWallet;
  int? addCalculate;
  String? createTime;
  String? updateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['billId'] = billId;
    map['walletType'] = walletType;
    map['walletTypeName'] = walletTypeName;
    map['walletTypeIcon'] = walletTypeIcon;
    map['walletName'] = walletName;
    map['walletAmount'] = walletAmount;
    map['showWallet'] = showWallet;
    map['addCalculate'] = addCalculate;
    map['createTime'] = createTime;
    map['updateTime'] = updateTime;
    return map;
  }
}
