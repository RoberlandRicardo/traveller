import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/styles/custom_text.dart';

class Input extends StatelessWidget {
  final String label;
  final Function onChanged;
  final String? placeholder;

  Input({required this.label, required this.onChanged, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Column(
        children: [
          TextField(
            style: CustomText.input,
            onChanged: (value) => onChanged(value),
            decoration: InputDecoration(
                labelText: label,
                labelStyle: CustomText.label,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: placeholder ?? "",
                hintStyle: TextStyle(color: Color.fromRGBO(152, 152, 152, 1)),
                filled: true,
                fillColor: Color.fromRGBO(238, 238, 238, 1),
                border: InputBorder.none),
          ),
        ],
      ),
    );
  }
}
