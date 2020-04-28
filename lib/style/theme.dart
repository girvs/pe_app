import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  static ThemeData lightTheme = ThemeData(
    //focusColor: Colors.black,
    //primaryColor: Colors.black,
    scaffoldBackgroundColor: Color(0xfff0f0f0), //0xfff9f9f9
    backgroundColor: Color(0xfff0f0f0),
    //bottomAppBarColor: Color(0xfff0f0f0),
    appBarTheme: AppBarTheme(
      color: Color(0xfff0f0f0),
      //textTheme: TextTheme(title: TextStyle(color: Colors.black))
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    //primaryColor: Colors.white,
    scaffoldBackgroundColor: Color(0xff0c0c0c),
    backgroundColor: Color(0xff0c0c0c),
    //bottomAppBarColor: Color(0xff0c0c0c),
    dividerColor: Color(0xff292929),
    appBarTheme: AppBarTheme(
      color: Color(0xff0c0c0c),
    ),
  );

  static bool isDark = false;

  static Color containerColor = isDark ? Color(0xff191919) : Colors.white;
}
