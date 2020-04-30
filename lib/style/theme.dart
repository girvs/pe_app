import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  static ThemeData lightTheme = ThemeData(

    //primaryColor: Colors.black,
    scaffoldBackgroundColor: Color.fromARGB(255, 237, 237, 237), //0xfff9f9f9
    backgroundColor: Color.fromARGB(255, 237, 237, 237),
    dividerColor: Color.fromARGB(255, 231, 231, 231),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: InputBorder.none,
    ),
    bottomAppBarColor: Color.fromARGB(255, 246, 246, 246),

    appBarTheme: AppBarTheme(
      color: Color.fromARGB(255, 237, 237, 237),
      textTheme: TextTheme(
        title: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
      ),
      iconTheme: IconThemeData(size: 22, color: Colors.black),
      actionsIconTheme: IconThemeData(size: 22, color: Colors.black),
    ),

    tabBarTheme: TabBarTheme(
      labelColor: Colors.black,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    //primaryColor: Colors.white,
    brightness: Brightness.dark,
    //primaryColor: Colors.white,
    scaffoldBackgroundColor: Color.fromARGB(255, 25, 25, 25),
    backgroundColor: Color.fromARGB(255, 25, 25, 25),
    bottomAppBarColor: Colors.black,
    dividerColor: Color.fromARGB(255, 25, 25, 25),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color.fromARGB(255, 42, 42, 42),
      border: InputBorder.none,
    ),
    appBarTheme: AppBarTheme(
      color: Color.fromARGB(255, 25, 25, 25), //Color(0xff0c0c0c),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.white,
    ),
  );

  //判断系统当前是否为暗黑模式
  static bool isDark = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;

  static Color containerColor =
      isDark ? Color.fromARGB(255, 35, 35, 35) : Colors.white;
}
