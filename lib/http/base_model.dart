class BaseModel<T> {
  T? data;
  int? code;
  String? type;
  String? msg;

  BaseModel.fromJson(dynamic json) {
    data = json['data'];
    code = json['code'];
    type = json['type'];
    msg = json['msg'];
  }
}