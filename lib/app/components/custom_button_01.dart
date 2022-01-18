// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/styles/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final bool? outline;
  final Function action;

  CustomButton({required this.textButton, this.outline, required this.action});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: (ElevatedButton(
          child: Text(textButton,
              style: outline ?? false
                  ? TextStyle(
                      fontSize: CustomText.fontSizeButton,
                      color: Theme.of(context).colorScheme.primary)
                  : Theme.of(context).textTheme.button),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(
                          color: outline ?? false
                              ? Theme.of(context).colorScheme.primary
                              : Colors.black))),
              backgroundColor: MaterialStateProperty.all<Color>(outline ?? false
                  ? Color.fromRGBO(0, 0, 0, 0)
                  : Theme.of(context).colorScheme.primary),
              elevation:
                  MaterialStateProperty.all<double>(outline ?? false ? 0 : 2)),
          onPressed: () => action(),
        )),
      ),
    );
  }
}
