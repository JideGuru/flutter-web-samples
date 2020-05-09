import 'package:flutter/material.dart';

class ThemeConfig{
  //Colors for theme
  static Color lightPrimary = Colors.white;
  static Color lightAccent = Color(0xff199688);
  static Color lightBG = Colors.white;

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor:  lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
  );
}