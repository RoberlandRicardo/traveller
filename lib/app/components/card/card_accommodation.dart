import 'package:flutter/material.dart';
import 'package:traveller/app/components/container_text.dart';

class CardAccommodation extends StatefulWidget {
  final String accommodation;
  final String checkIn;
  final String checkOut;
  final String price;

  CardAccommodation(
      {required this.accommodation,
      required this.checkIn,
      required this.checkOut,
      required this.price});

  @override
  _CardAccommodationState createState() => _CardAccommodationState();
}

class _CardAccommodationState extends State<CardAccommodation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ContainerText(
              type: Icons.hotel,
              title: 'Hospedagem',
              text: widget.accommodation),
          ContainerText(title: 'Check in', text: widget.checkIn),
          ContainerText(title: 'Check out', text: widget.checkOut),
          ContainerText(title: 'Preço', text: 'RS ' + widget.price)
        ]));
  }
}
