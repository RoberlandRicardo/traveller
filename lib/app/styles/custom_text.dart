import 'package:flutter/material.dart';

class CustomText extends TextTheme {
  static final String fontFamily = 'Source Sans Pro';
  static final Color fontColor = Color.fromRGBO(19, 19, 19, 1);
  static final Color fontColorButton = Color.fromRGBO(227, 227, 227, 1);
  static final double fontSizeh1 = 34;
  static final double fontSizeSubtitle = 16;
  static final double fontSizeButton = 16;
  static final double fontSizeLabel = 14;
  static final double fontSizeInput = 16;

  static final TextStyle label = TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSizeLabel,
      color: fontColor,
      fontWeight: FontWeight.w700);

  static final TextStyle input = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeInput,
    color: fontColor,
  );

  CustomText()
      : super(
          headline1: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSizeh1,
              color: fontColor,
              fontWeight: FontWeight.w700),
          subtitle1: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSizeSubtitle,
            color: fontColor,
          ),
          button: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSizeButton,
            color: fontColorButton,
          ),
        );
}
