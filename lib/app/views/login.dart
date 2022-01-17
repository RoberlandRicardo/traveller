import 'package:flutter/material.dart';
import 'package:traveller/app/components/generic_screen_nivel01.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      textFirstButton: "ENTRAR",
      textSecondButton: "AINDA NÃO TENHO CONTA",
      functionFirstButton: () => {},
      functionSecondButton: () =>
          {Navigator.pushReplacementNamed(context, '/cadastro')},
      child: SizedBox(),
    );
  }
}
