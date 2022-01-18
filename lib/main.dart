import 'package:flutter/material.dart';
import 'package:traveller/app/styles/custom_colors.dart';
import 'package:traveller/app/styles/custom_text.dart';
import 'package:traveller/app/views/cadastro.dart';
import 'package:traveller/app/views/login.dart';
import 'package:traveller/app/views/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    title: "Traveller",
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/login': (context) => Login(),
      '/cadastro': (context) => Cadastro(),
    },
    theme: ThemeData(
        fontFamily: CustomText.fontFamily,
        colorScheme: CustomColors(),
        textTheme: CustomText()),
  ));
}
