import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/styles/custom_text.dart';

class CardRota extends StatefulWidget {
  final bool last;

  CardRota({required this.last});

  @override
  _CardRotaState createState() => _CardRotaState();
}

Widget dashedArrow(BuildContext context) {
  return Stack(
    children: [
      Container(
        alignment: Alignment(-0, -0.5),
        child: Column(
          children: [
            for (var i = 0; i < 4; i++)
              Column(
                children: [
                  Container(
                    width: 2,
                    height: 5,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 2,
                  )
                ],
              ),
          ],
        ),
      ),
      Container(
        height: 38,
        alignment: Alignment(-0, 1),
        child: RotationTransition(
            turns: AlwaysStoppedAnimation(90 / 360),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
    ],
  );
}

class _CardRotaState extends State<CardRota> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(0),
          color: Color.fromRGBO(233, 230, 230, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: GestureDetector(
            child: Container(
              height: 75,
              child: FractionallySizedBox(
                widthFactor: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Text(
                          "Localização",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: CustomText.fontSizeh4,
                              color: Color.fromRGBO(83, 83, 83, 1)),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Text(
                          "00/00/0000 00:00:00",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: CustomText.fontSizeBody,
                              color: Color.fromRGBO(83, 83, 83, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        widget.last == false ? dashedArrow(context) : SizedBox(),
      ],
    );
  }
}
