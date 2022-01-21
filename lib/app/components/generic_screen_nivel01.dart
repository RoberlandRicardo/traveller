// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/components/custom_button_01.dart';

class GenericScreen extends StatelessWidget {
  final Widget child;
  final String textFirstButton;
  final String textSecondButton;
  final Function functionFirstButton;
  final Function functionSecondButton;
  final Function functionHomeButton;

  GenericScreen(
      {required this.child,
      required this.textFirstButton,
      required this.textSecondButton,
      required this.functionFirstButton,
      required this.functionSecondButton,
      required this.functionHomeButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              SizedBox(
                height: 30,
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
              child,
              TextButton(
                child: Text(
                  "Modo sem autenticação",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      color: Color.fromRGBO(244, 54, 27, 1),
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () => functionHomeButton(),
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
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background);
  }
}
