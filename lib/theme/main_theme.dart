import 'package:flutter/material.dart';

class ThemeClass {
  static Color lightThemePrimary = Color(0xFF00002C);
  static Color lightThemeSecondary = Color(0xFFFBF7F4);
  static Color darkThemePrimary = Color(0xFFFBF7F4);
  static Color darkThemeSecondary = Color(0xFF00002C);

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light().copyWith(
      primary: lightThemePrimary,
      secondary: lightThemeSecondary,
      // onPrimary: Colors.white,
      // error: Color(0xFDFF0000),
      // onError: Colors.white,
    ),
    scaffoldBackgroundColor: lightThemePrimary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => lightThemeSecondary),
      ),
    ),
    iconTheme: IconThemeData(color: lightThemePrimary),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark().copyWith(
      primary: darkThemePrimary,
      secondary: darkThemeSecondary,
    ),
    scaffoldBackgroundColor: darkThemePrimary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => darkThemeSecondary),
      ),
    ),
    iconTheme: IconThemeData(color: darkThemePrimary),
  );
}
