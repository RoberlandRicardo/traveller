import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/components/custom_button_01.dart';

class GenericScreen extends StatelessWidget {
  final Widget child;
  final String textFirstButton;
  final String textSecondButton;
  final Function functionFirstButton;
  final Function functionSecondButton;

  GenericScreen(
      {required this.child,
      required this.textFirstButton,
      required this.textSecondButton,
      required this.functionFirstButton,
      required this.functionSecondButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              child,
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
              CustomButton(
                textButton: textFirstButton,
                outline: false,
                action: functionFirstButton,
              ),
              SizedBox(
                height: 15,
              ),
              CustomButton(
                textButton: textSecondButton,
                outline: true,
                action: functionSecondButton,
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromRGBO(245, 170, 82, 1));
  }
}
