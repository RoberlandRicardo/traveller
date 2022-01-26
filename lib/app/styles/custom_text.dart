import 'package:flutter/material.dart';

class CustomText extends TextTheme {
  static final String fontFamily = 'Source Sans Pro';
  static final Color fontColor = Color.fromRGBO(19, 19, 19, 1);
  static final Color fontColor2 = Color.fromRGBO(0, 0, 0, 1);
  static final Color fontColorButton = Color.fromRGBO(227, 227, 227, 1);
  static final Color fontColorTopBar = Color.fromRGBO(227, 227, 227, 1);
  static final Color fontColorOrange = Color.fromRGBO(244, 54, 27, 1);
  static final double fontSizeh1 = 34;
  static final double fontSizeh2 = 24;
  static final double fontSizeh3 = 22;
  static final double fontSizeh4 = 20;
  static final double fontSizeSubtitle = 16;
  static final double fontSizeButton = 16;
  static final double fontSizeLabel = 14;
  static final double fontSizeLabelModal = 16;
  static final double fontSizeInput = 16;
  static final double fontSizeInputModal = 16;
  static final double fontSizeBody = 16;
  static final double fontSizeTopBar = 20;

  static final TextStyle label = TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSizeLabel,
      color: fontColor,
      fontWeight: FontWeight.w700);

  static final TextStyle labelModal = TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSizeLabelModal,
      color: fontColor,
      fontWeight: FontWeight.w700);

  static final TextStyle input = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeInput,
    color: fontColor,
  );

  static final TextStyle inputModal = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeInputModal,
    color: fontColor,
  );

  static final TextStyle topBar = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeTopBar,
    color: fontColorTopBar,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle buttonOrange = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeButton,
    color: fontColorOrange,
    fontWeight: FontWeight.w700,
  );

  CustomText()
      : super(
          headline1: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSizeh1,
              color: fontColor,
              fontWeight: FontWeight.w700),
          headline2: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSizeh2,
              color: fontColor,
              fontWeight: FontWeight.w700),
          headline3: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSizeh3,
              color: fontColor,
              fontWeight: FontWeight.w700),
          headline4: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSizeh4,
            color: fontColor,
          ),
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
          bodyText1: TextStyle(
              fontFamily: fontFamily, fontSize: fontSizeBody, color: fontColor),
          bodyText2: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSizeBody,
              color: fontColor2),
        );
}
