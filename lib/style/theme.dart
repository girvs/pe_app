import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xfff9f9f9),
    scaffoldBackgroundColor: Color(0xfff0f0f0),//0xfff9f9f9
    backgroundColor: Color(0xfff0f0f0),
    bottomAppBarColor: Color(0xfff0f0f0),
    appBarTheme: AppBarTheme(
      color: Color(0xfff0f0f0),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xff191919),
    backgroundColor: Color(0xff191919),
    bottomAppBarColor: Color(0xff0c0c0c),
    appBarTheme: AppBarTheme(
      color: Color(0xff0c0c0c),
    ),
  );

  static Color getContainerColor(bool isDarkMode) {
    return isDarkMode ? Color(0xff0f0f0f) : Colors.white;
  }
}
