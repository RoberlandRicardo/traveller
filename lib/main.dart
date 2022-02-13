import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:traveller/app/components/generic_screen_nivel02.dart';
import 'package:traveller/app/views/cadastro_travel.dart';
import 'package:traveller/app/views/perfil.dart';
import 'package:traveller/app/styles/custom_colors.dart';
import 'package:traveller/app/styles/custom_text.dart';
import 'package:traveller/app/views/cadastro.dart';
import 'package:traveller/app/views/home.dart';
import 'package:traveller/app/views/login.dart';
import 'package:traveller/app/views/splash_screen.dart';
import 'package:traveller/app/views/travel.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Traveller",
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/cadastro': (context) => Cadastro(),
        '/home': (context) => Home(),
        '/travel': (context) => PageTravels(),
        '/perfil': (context) => Perfil(),
        '/cadastroTravel': (context) => Campos(),
      },
      theme: ThemeData(
          fontFamily: CustomText.fontFamily,
          colorScheme: CustomColors(),
          textTheme: CustomText()),
      // home: TabContainer(),
    );
  }
}
