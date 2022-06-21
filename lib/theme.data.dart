import 'package:flutter/material.dart' hide Theme;
import 'package:socio/models/theme.dart';

final Color primary = Color.fromRGBO(255, 142, 1, 1);
final Color primaryVariant = Color.fromRGBO(255, 242, 1, 1);
final Color secundary = Color.fromRGBO(27, 113, 186, 1);
final Color secundaryVariant = Color.fromRGBO(149, 26, 130, 1);

final Map<Theme, ThemeData> themesData = {
  Theme.ligth: ThemeData(
    textTheme: TextTheme(
        subtitle1: TextStyle(color: Colors.white),
        button: TextStyle(color: Colors.white)),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.white,
          )),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(
          color: primary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(
          color: primary,
          width: 1.5,
        ),
      ),
    ),
    colorScheme: ColorScheme(
      primary: primary,
      primaryVariant: primaryVariant,
      secondary: secundary,
      secondaryVariant: secundaryVariant,
      surface: Colors.white,
      background: Colors.white,
      error: Colors.redAccent,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: primary,
      onBackground: primary,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
  ),
  Theme.dark: ThemeData(
    primaryColor: Color.fromRGBO(255, 142, 1, 1),
    colorScheme: ColorScheme(
        primary: primary,
        primaryVariant: primaryVariant,
        secondary: secundary,
        secondaryVariant: secundaryVariant,
        surface: Colors.white,
        background: Colors.white,
        error: Colors.redAccent,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: primary,
        onBackground: primary,
        onError: Colors.white,
        brightness: Brightness.dark),
    textTheme: TextTheme(
        button: TextStyle(color: Colors.white),
        overline: TextStyle(color: primary)),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.white),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: Colors.white,
          )),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(
          color: primary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(
          color: primary,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: BorderSide(
          color: Colors.redAccent,
          width: 1.5,
        ),
      ),
    ),
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
  ),
};
