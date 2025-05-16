import 'package:flutter/widgets.dart';

class AppSettings with ChangeNotifier{
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