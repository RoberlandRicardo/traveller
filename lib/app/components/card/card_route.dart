import 'package:flutter/material.dart';
import 'package:traveller/app/components/container_text.dart';

class CardRoute extends StatefulWidget {
  final String route;
  final String price;
  CardRoute({required this.route, required this.price});

  @override
  _CardRouteState createState() => _CardRouteState();
}

class _CardRouteState extends State<CardRoute> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ContainerText(
              type: Icons.location_on, title: 'Rota', text: widget.route),
          ContainerText(title: 'Preço', text: 'RS ' + widget.price)
        ]));
  }
}
