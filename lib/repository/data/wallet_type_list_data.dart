class WalletTypeListData {
  WalletTypeListData({this.data});

  WalletTypeListData.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(WalletTypeItemData.fromJson(v));
      });
    }
  }

  List<WalletTypeItemData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['WalletTypeItemData'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class WalletTypeItemData {
  WalletTypeItemData({
    this.id,
    this.name,
    this.type,
    this.assetType,
    this.isLiabilities,
  });

  WalletTypeItemData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    assetType = json['assetType'];
    isLiabilities = json['isLiabilities'];
  }
  String? id;
  String? name;
  int? type;
  int? assetType;
  int? isLiabilities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    map['assetType'] = assetType;
    map['isLiabilities'] = isLiabilities;
    return map;
  }

  @override
  String toString() {
    return 'WalletTypeItemData{id: $id, name: $name, type: $type, assetType: $assetType, isLiabilities: $isLiabilities}';
  }
}
