import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/styles/custom_text.dart';

class GenericModal extends StatefulWidget {
  final String title;
  final Icon icon;

  GenericModal({required this.title, required this.icon});

  @override
  State<GenericModal> createState() => _GenericModalState();
}

class _GenericModalState extends State<GenericModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              widget.icon,
              SizedBox(
                width: 3,
              ),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headline3,
              )
            ],
          ),
          Row(
            children: [
              GestureDetector(
                child: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1,
                        children: [
                      TextSpan(
                          text: "CANCELAR",
                          style: TextStyle(color: CustomText.fontColorOrange))
                    ])),
              ),
              GestureDetector(
                child: RichText(
                    text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1,
                        children: [
                      TextSpan(
                          text: "CONFIRMAR",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary))
                    ])),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
