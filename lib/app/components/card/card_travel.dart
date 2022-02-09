import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/styles/custom_text.dart';
import 'package:traveller/app/util/extensionFunctions.dart';

class CardTravel extends StatelessWidget {
  final String? titulo;
  final DateTime data;

  CardTravel({this.titulo, required this.data});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 60),
        child: Card(
          color: Color.fromRGBO(225, 225, 225, 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Text(
                      titulo ?? "[Viagem sem titulo...]",
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Text(
                      data.toStringBR(format: 'date'),
                      style: CustomText.bodyTextMinCard,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
