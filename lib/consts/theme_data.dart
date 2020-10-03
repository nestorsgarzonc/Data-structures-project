import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: const Color(0xFFE94832),
  buttonColor: const Color(0xFFE94832),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFE94832),
    elevation: 5,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 10,
    selectedIconTheme: IconThemeData(size: 30),
  ),
);
