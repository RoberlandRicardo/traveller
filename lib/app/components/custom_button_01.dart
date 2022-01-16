// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButton extends StatelessWidget {
  final String textButton;
  final bool? outline;

  CustomButton({required this.textButton, this.outline});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: (ElevatedButton(
          child: Text(
            textButton,
            style: TextStyle(
                color: outline ?? false
                    ? Color.fromRGBO(5, 41, 60, 1)
                    : Color.fromRGBO(227, 227, 227, 1)),
          ),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(
                          color: outline ?? false
                              ? Color.fromRGBO(5, 41, 60, 1)
                              : Colors.black))),
              backgroundColor: MaterialStateProperty.all<Color>(outline ?? false
                  ? Color.fromRGBO(0, 0, 0, 0)
                  : Color.fromRGBO(5, 41, 60, 1)),
              elevation:
                  MaterialStateProperty.all<double>(outline ?? false ? 0 : 2)),
          onPressed: () {},
        )),
      ),
    );
  }
}
