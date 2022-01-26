import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/styles/custom_text.dart';

class InputModal extends StatelessWidget {
  final String? label;
  final Function onChanged;
  final String? placeholder;

  InputModal({this.label, required this.onChanged, this.placeholder});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: <Widget>[
            label != null
                ? FractionallySizedBox(
                    widthFactor: 1,
                    child: Text(
                      label!,
                      style: CustomText.labelModal,
                      textAlign: TextAlign.start,
                    ),
                  )
                : SizedBox(),
            TextField(
              style: CustomText.inputModal,
              onChanged: (value) => onChanged(value),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                  isDense: true,
                  hintText: placeholder ?? "",
                  hintStyle: TextStyle(color: Color.fromRGBO(152, 152, 152, 1)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(165, 165, 165, 1)))),
            ),
          ],
        ),
      ),
    );
  }
}
