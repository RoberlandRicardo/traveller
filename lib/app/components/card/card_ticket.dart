import 'package:flutter/material.dart';
import 'package:traveller/app/components/container_text.dart';

class CardTicket extends StatefulWidget {
  final String type;
  final String place;
  final String going;
  final String arrival;
  final String price;
  const CardTicket(
      {required this.type,
      required this.place,
      required this.going,
      required this.arrival,
      required this.price});

  @override
  _CardTicketState createState() => _CardTicketState();
}

class _CardTicketState extends State<CardTicket> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ContainerText(
              type: widget.type == 'Indo'
                  ? Icons.flight_takeoff
                  : Icons.flight_land,
              title: widget.type,
              text: widget.place),
          ContainerText(title: 'Ida', text: widget.going),
          ContainerText(title: 'Chegada', text: widget.arrival),
          ContainerText(
              title: 'Preço partida + volta', text: 'RS ' + widget.price)
        ]));
  }
}
