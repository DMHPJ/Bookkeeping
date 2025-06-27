import 'package:flutter/material.dart';
import 'package:flutter_application_1/http/dio_instance.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings with ChangeNotifier {
  bool _showBottomTabBar = true;
  bool get showBottomTabBar => _showBottomTabBar;

  void hideBottomTabBarFunc() {
    _showBottomTabBar = false;
    notifyListeners();
  }

  void showBottomTabBarFunc() {
    _showBottomTabBar = true;
    notifyListeners();
  }
}

class Environment {
  static const String env = String.fromEnvironment('dev');
  static const String apiUrl = String.fromEnvironment('apiUrl');
}

class Global {
  static late SharedPreferences prefs;
  static ThemeData globalTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF2965FF),
        onPrimary: Color(0xFFF9F9F9),
        secondary: Color(0xFFF2F8FF),
        onSecondary: Color(0xFFF9F9F9),
        error: Color(0xFFFF2965),
        onError: Color(0xFFF9F9F9),
        surface: Color(0xFFF9F9F9),
        onSurface: Color(0xFF333333),
      ),
    );
  }

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    prefs = await SharedPreferences.getInstance();
    //初始化网络请求相关配置
    DioInstance.instance().initDio(baseUrl: Environment.apiUrl);
  }
}
