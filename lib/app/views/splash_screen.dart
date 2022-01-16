import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/components/custom_button_01.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(19, 19, 19, 1)),
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
              Text(
                "Modo sem autenticação",
                style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    color: Color.fromRGBO(244, 54, 27, 1),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(textButton: "LOGAR", outline: false),
              SizedBox(
                height: 15,
              ),
              CustomButton(textButton: "CRIAR NOVA CONTA", outline: true),
            ],
          ),
        ),
        backgroundColor: Color.fromRGBO(245, 170, 82, 1));
  }
}
