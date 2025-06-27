class BaseModel<T> {
  BaseModel({this.data, this.code = 0, this.type = 'error', this.msg = ''});

  T? data;
  int code;
  String type;
  String msg;

  BaseModel.fromJson(dynamic json)
      : data = json['data'],
        code = json['code'] ?? 0,
        type = json['type'] ?? 'error',
        msg = json['msg'] ?? '初始化异常';

  @override
  String toString() {
    return 'BaseModel{type: $type, code: $code, data: $data, msg: $msg}';
  }
}