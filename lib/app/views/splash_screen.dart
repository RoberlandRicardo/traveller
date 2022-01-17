import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/components/custom_button_01.dart';
import 'package:traveller/app/components/generic_screen_nivel01.dart';

class SplashScreen extends StatelessWidget {
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
            SizedBox(
              height: 35,
            ),
            Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                )),
            SizedBox(
              height: 15,
            ),
            Text(
              "BEM VINDO,",
              style:
                  TextStyle(fontSize: 16, color: Color.fromRGBO(19, 19, 19, 1)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "O TRAVELLER \n TE AGUARDA =)",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(19, 19, 19, 1)),
            ),
            Image.asset(
              'assets/traveling-pana.png',
              width: 300,
              height: 270,
              fit: BoxFit.fitWidth,
            ),
          ],
        ));
  }
}
