import 'package:flutter/material.dart';
import 'package:traveller/app/components/generic_screen_nivel01.dart';
import 'package:traveller/app/components/input/input_01.dart';
import 'package:traveller/app/styles/custom_text.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      textFirstButton: "ENTRAR",
      textSecondButton: "AINDA NÃO TENHO CONTA",
      functionFirstButton: () =>
          {Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false)},
      functionSecondButton: () =>
          {Navigator.pushReplacementNamed(context, '/cadastro')},
      functionHomeButton: () {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          children: [
            Text(
              "Bem vindo de volta!",
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(19, 19, 19, 1)),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Faça login para continuar no Traveller",
              style:
                  TextStyle(fontSize: 16, color: Color.fromRGBO(19, 19, 19, 1)),
            ),
            SizedBox(
              height: 40,
            ),
            Input(
                label: "Usuário",
                placeholder: "Digite seu usuário",
                onChanged: (value) {
                  print(value);
                }),
            SizedBox(
              height: 20,
            ),
            Input(
                label: "Senha",
                placeholder: "Digite sua senha",
                onChanged: (value) {
                  print(value);
                }),
            SizedBox(
              height: 15,
            ),
            FractionallySizedBox(
              widthFactor: 0.96,
              child: GestureDetector(
                onTap: () => {},
                child: Text(
                  "Esqueci minha senha",
                  style: TextStyle(
                      fontFamily: CustomText.fontFamily,
                      color: CustomText.fontColor,
                      decoration: TextDecoration.underline),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
