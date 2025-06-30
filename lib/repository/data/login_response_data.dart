import 'package:flutter_application_1/repository/appSettings.dart';

class LoginResponseData {
  LoginResponseData({
    this.id,
    this.billId,
    this.username,
    this.password,
    this.nickname,
    this.token,
  });

  LoginResponseData.fromJson(dynamic json) {
    id = json['id'];
    billId = json['billId'];
    username = json['username'];
    password = json['password'];
    nickname = json['nickname'];
    token = json['token'];
  }

  String? id;
  String? billId;
  String? username;
  String? password;
  String? nickname;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['billId'] = billId;
    map['username'] = username;
    map['password'] = password;
    map['nickname'] = nickname;
    map['token'] = token;
    return map;
  }

  void saveLoginResponseData(LoginResponseData loginResponseData) async {
    await Global.prefs.setString(
      'loginInfo',
      '{"id":"${loginResponseData.id}","billId":"${loginResponseData.billId}",username":"${loginResponseData.username}","password":"${loginResponseData.password}",nickname":"${loginResponseData.nickname}","token":"${loginResponseData.token}"}',
    );
  }

  @override
  String toString() {
    return 'LoginResponseData{"id":"$id","billId":"$billId",username":"$username","password":"$password",nickname":"$nickname","token":"$token"}';
  }
}
