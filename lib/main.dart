import 'package:flutter/material.dart';
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
  ));
}
