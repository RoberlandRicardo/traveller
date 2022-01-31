import 'package:flutter/material.dart';
import 'package:traveller/app/components/container_text.dart';

class CardParada extends StatefulWidget {
  final String parada;
  final String price;
  CardParada({required this.parada, required this.price});

  @override
  _CardParadaState createState() => _CardParadaState();
}

class _CardParadaState extends State<CardParada> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ContainerText(
              type: Icons.location_on, title: 'Rota', text: widget.parada),
          ContainerText(title: 'Preço', text: 'RS ' + widget.price)
        ]));
  }
}
