import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardRoute extends StatefulWidget {
  final bool last;

  CardRoute({required this.last});

  @override
  _CardRouteState createState() => _CardRouteState();
}

class _CardRouteState extends State<CardRoute> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(233, 230, 230, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        height: 75,
      ),
    );
  }
}
