import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/components/custom_button_01.dart';
import 'package:traveller/app/components/generic_screen_nivel01.dart';
import 'package:traveller/app/database/off_authentication/controller/controllerTravel.dart';
import 'package:traveller/app/stores/actions.dart';
import 'package:traveller/app/stores/app_state.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return GenericScreen(
        textFirstButton: "LOGIN",
        textSecondButton: "CRIAR NOVA CONTA",
        functionFirstButton: () {
          Navigator.pushNamed(context, '/login');
        },
        functionSecondButton: () {
          Navigator.pushNamed(context, '/cadastro');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("BEM VINDO,", style: Theme.of(context).textTheme.subtitle1),
            SizedBox(
              height: 15,
            ),
            Text(
              "O TRAVELLER \n TE AGUARDA =)",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            Image.asset(
              'assets/images/traveling-pana.png',
              width: 300,
              height: 250,
              fit: BoxFit.fitWidth,
            ),
          ],
        ));
  }
}
