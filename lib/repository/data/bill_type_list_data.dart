class BillTypeListData {
  BillTypeListData({this.data});

  BillTypeListData.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(BillTypeItemData.fromJson(v));
      });
    }
  }

  List<BillTypeItemData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['BillTypeItemData'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class BillTypeItemData {
  BillTypeItemData({
    this.id,
    this.parentId,
    this.parentName,
    this.parentIcon,
    this.icon,
    this.isIncome = 0,
    this.name,
    this.createTime,
    this.children = const [],
  });

  BillTypeItemData.fromJson(dynamic json) {
    id = json['id'];
    parentId = json['parentId'];
    parentName = json['parentName'];
    parentIcon = json['parentIcon'];
    icon = json['icon'];
    isIncome = json['isIncome'];
    name = json['name'];
    createTime = json['createTime'];

    if (json["children"] != null) {
      children = [];
      json["children"].forEach((v) {
        children?.add(BillTypeItemData.fromJson(v));
      });
    }
  }
  String? id;
  String? parentId;
  String? parentName;
  String? parentIcon;
  String? icon;
  int? isIncome;
  String? name;
  String? createTime;
  List<BillTypeItemData>? children;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['parentId'] = parentId;
    map['parentName'] = parentName;
    map['parentIcon'] = parentIcon;
    map['icon'] = icon;
    map['isIncome'] = isIncome;
    map['name'] = name;
    map['createTime'] = createTime;
    // 序列化 children
    if (children != null) {
      map['children'] = children?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    return 'BillTypeItemData{id: $id, parentId: $parentId, parentName: $parentName, parentIcon: $parentIcon, icon: $icon, isIncome: $isIncome, name: $name, createTime: $createTime, children: $children}';
  }
}
