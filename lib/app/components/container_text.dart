import 'package:flutter/material.dart';

class ContainerText extends StatelessWidget {
  final IconData? type;
  final String title;
  final String text;
  ContainerText({this.type, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (type != null)
          Icon(
            type,
            color: Color.fromRGBO(244, 54, 27, 1),
          ),
        Text(
          ' ' + title + ': ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(text)
      ],
    );
  }
}
