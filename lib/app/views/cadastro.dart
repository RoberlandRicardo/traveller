import 'package:flutter/material.dart';
import 'package:traveller/app/components/generic_screen_nivel01.dart';

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      textFirstButton: "CRIAR CONTA",
      textSecondButton: "EU JÁ POSSUO CONTA",
      functionFirstButton: () => {},
      functionSecondButton: () =>
          {Navigator.pushReplacementNamed(context, '/login')},
      child: SizedBox(),
    );
  }
}
