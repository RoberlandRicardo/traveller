import 'package:flutter/material.dart';

class CustomColors extends ColorScheme {
  static final Color primaryColor = Color.fromRGBO(5, 41, 60, 1);
  static final Color secondaryColor = Color.fromRGBO(244, 54, 27, 1);
  static final Color backgroundColor = Color.fromRGBO(245, 170, 82, 1);

  CustomColors()
      : super(
          primary: primaryColor,
          secondary: secondaryColor,
          background: backgroundColor,
          error: Colors.red,
          brightness: Brightness.light,
          surface: Colors.white,
          // ---------------------------
          primaryVariant: primaryColor,
          secondaryVariant: secondaryColor,
          // ---------------------------
          onPrimary: primaryColor,
          onSecondary: secondaryColor,
          onBackground: backgroundColor,
          onError: Colors.red,
          onSurface: Colors.white,
        );
}
