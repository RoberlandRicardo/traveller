import 'package:flutter/material.dart';
import 'package:traveller/app/components/generic_screen_nivel02.dart';
import 'package:traveller/app/views/perfil.dart';
// import 'package:traveller/app/components/tab_container.dart';
import 'package:traveller/app/styles/custom_colors.dart';
import 'package:traveller/app/styles/custom_text.dart';
import 'package:traveller/app/views/cadastro.dart';
import 'package:traveller/app/views/home.dart';
import 'package:traveller/app/views/login.dart';
import 'package:traveller/app/views/splash_screen.dart';
import 'package:traveller/app/views/travel.dart';

void main() {
  runApp(MaterialApp(
    title: "Traveller",
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/login': (context) => Login(),
      '/cadastro': (context) => Cadastro(),
      '/home': (context) => Home(),
      '/travel': (context) => Travel(),
      '/perfil': (context) => Perfil(),
    },
    theme: ThemeData(
        fontFamily: CustomText.fontFamily,
        colorScheme: CustomColors(),
        textTheme: CustomText()),
    // home: TabContainer(),
  ));
}
