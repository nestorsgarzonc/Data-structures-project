import 'package:flutter/material.dart';

const _mainColor = Color(0xFFE94832);

final ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: _mainColor,
  buttonTheme: const ButtonThemeData(
    buttonColor: _mainColor,
  ),
  buttonColor: _mainColor,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: _mainColor,
    elevation: 5,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 10,
    selectedIconTheme: IconThemeData(size: 30),
  ),
);
