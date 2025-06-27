class LoginData {
  LoginData({this.username, this.password});

  LoginData.fromJson(dynamic json) {
    username = json['username'];
    password = json['password'];
  }

  String? username;
  String? password;

  @override
  String toString() {
    return 'LoginData{username: $username, password: $password}';
  }
}
