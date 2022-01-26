import 'package:flutter/material.dart';
import 'package:traveller/app/components/generic_screen_nivel01.dart';
import 'package:traveller/app/components/input/input_01.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      textFirstButton: "CRIAR CONTA",
      textSecondButton: "EU JÁ POSSUO CONTA",
      functionFirstButton: () => {},
      functionSecondButton: () =>
          {Navigator.pushReplacementNamed(context, '/login')},
      functionHomeButton: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          children: [
            Text(
              "Cadastro",
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(19, 19, 19, 1)),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Planeje suas viagens no Traveller',
              style:
                  TextStyle(fontSize: 16, color: Color.fromRGBO(19, 19, 19, 1)),
            ),
            SizedBox(
              height: 30,
            ),
            Input(
                label: "Usuário",
                placeholder: "Digite um usuário",
                onChanged: (value) {
                  print(value);
                }),
            SizedBox(
              height: 20,
            ),
            Input(
                label: "Senha",
                placeholder: "Digite uma senha",
                onChanged: (value) {
                  print(value);
                }),
            SizedBox(
              height: 20,
            ),
            Input(
                label: "Repita sua senha",
                placeholder: "Digite uma senha novamente",
                onChanged: (value) {
                  print(value);
                }),
            SizedBox(
              height: 20,
            ),
            Input(
                label: "Email",
                placeholder: "Digite seu email",
                onChanged: (value) {
                  print(value);
                }),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
