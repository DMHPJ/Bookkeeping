class LoginData {
  LoginData({this.username, this.password});

  LoginData.fromJson(dynamic json) {
    username = json['username'];
    password = json['password'];
  }

  String? username;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    return map;
  }

  @override
  String toString() {
    return 'LoginData{username: $username, password: $password}';
  }
}
