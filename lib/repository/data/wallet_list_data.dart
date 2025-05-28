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
    this.walletName,
    this.walletAmount,
    this.createTime,
    this.updateTime,
  });

  WalletItemData.fromJson(dynamic json) {
    id = json['id'];
    billId = json['billId'];
    walletType = json['walletType'];
    walletTypeName = json['walletTypeName'];
    walletName = json['walletName'];
    walletAmount = json['walletAmount'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }
  String? id;
  String? billId;
  int? walletType;
  String? walletTypeName;
  String? walletName;
  String? walletAmount;
  String? createTime;
  String? updateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['billId'] = billId;
    map['walletType'] = walletType;
    map['walletTypeName'] = walletTypeName;
    map['walletName'] = walletName;
    map['walletAmount'] = walletAmount;
    map['createTime'] = createTime;
    map['updateTime'] = updateTime;
    return map;
  }
}
