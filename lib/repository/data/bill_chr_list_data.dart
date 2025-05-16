class BillChrListData {
  BillChrListData({this.data});

  BillChrListData.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(BillChrItemData.fromJson(v));
      });
    }
  }

  List<BillChrItemData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['BillChrItemData'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class BillChrItemData {
  BillChrItemData({
    this.id,
    this.icon,
    this.money,
    this.categoryId,
    this.categoryName,
    this.transactionType,
    this.moneyFrom,
    this.moneyTo,
    this.remark,
    this.owningDate,
    this.createTime,
    this.updateTime,
  });

  BillChrItemData.fromJson(dynamic json) {
    id = json['id'];
    icon = json['icon'];
    money = json['money'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    transactionType = json['transactionType'];
    moneyFrom = json['moneyFrom'];
    moneyTo = json['moneyTo'];
    remark = json['remark'];
    owningDate = json['owningDate'];
    createTime = json['createTime'];
    updateTime = json['updateTime'];
  }
  String? id;
  String? icon;
  String? money;
  String? categoryId;
  String? categoryName;
  num? transactionType;
  String? moneyFrom;
  String? moneyTo;
  String? remark;
  String? owningDate;
  String? createTime;
  String? updateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['icon'] = icon;
    map['money'] = money;
    map['categoryId'] = categoryId;
    map['categoryName'] = categoryName;
    map['transactionType'] = transactionType;
    map['moneyFrom'] = moneyFrom;
    map['moneyTo'] = moneyTo;
    map['remark'] = remark;
    map['owningDate'] = owningDate;
    map['createTime'] = createTime;
    map['updateTime'] = updateTime;
    return map;
  }
}
