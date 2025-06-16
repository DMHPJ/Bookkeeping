import 'package:flutter/material.dart';

class GlobalTheme {
  static ThemeData themeData() {
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
}
