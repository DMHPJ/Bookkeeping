import 'package:flutter_application_1/repository/appSettings.dart';

class LoginResponseData {
  LoginResponseData({
    this.id,
    this.nickname,
    this.password,
    this.type,
    this.billId,
  });

  LoginResponseData.fromJson(dynamic json) {
    id = json['username'];
    nickname = json['password'];
    password = json['password'];
    type = json['password'];
    billId = json['password'];
  }

  String? id;
  String? nickname;
  String? password;
  String? type;
  String? billId;

  void saveLoginResponseData(LoginResponseData loginResponseData) async {
    await Global.prefs.setString(
      'loginInfo',
      '{id: $id, nickname: $nickname, password: $password, type: $type, billId: $billId}',
    );
  }

  @override
  String toString() {
    return 'LoginResponseData{id: $id, nickname: $nickname, password: $password, type: $type, billId: $billId}';
  }
}
