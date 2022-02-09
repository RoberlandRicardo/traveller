import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/components/card/card_accommodation.dart';
import 'package:traveller/app/components/card/card_parada.dart';
import 'package:traveller/app/components/card/card_ticket.dart';
import 'package:traveller/app/styles/custom_text.dart';

class CardRotaTravel extends StatefulWidget {
  final String type;
  final String? subType;
  final String title;
  final String? label1;
  final String? label2;
  final String price;

  CardRotaTravel(
      {required this.type,
      this.subType,
      required this.title,
      this.label1,
      this.label2,
      required this.price});

  @override
  _CardRotaTravelState createState() => _CardRotaTravelState();
}

class _CardRotaTravelState extends State<CardRotaTravel> {
  String _subType = '';
  String _label1 = '';
  String _label2 = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    if (widget.type == 'passagem') {
      return cardWidget(screenHeight, bodyTextTicket);
    } else {
      return cardWidget(screenHeight, bodyTextAccommodationAndRoute);
    }
  }

  Widget cardWidget(double screenHeight, Function bodyText) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: screenHeight * 0.14,
            decoration: BoxDecoration(
              color: Color.fromRGBO(196, 196, 196, 1),
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          Column(children: [bodyText()])
        ],
      ),
    );
  }

  bodyTextAccommodationAndRoute() {
    if (widget.type == 'hospedagem') {
      setState(() {
        _label1 = widget.label1!;
        _label2 = widget.label2!;
      });
      return CardAccommodation(
        accommodation: widget.title,
        checkIn: _label1,
        checkOut: _label2,
        price: widget.price,
      );
    } else if (widget.type == 'rota') {
      return CardParada(
        parada: widget.title,
        price: widget.price,
      );
    }
  }

  bodyTextTicket() {
    setState(() {
      if (widget.subType == 'indo') {
        _subType = 'Indo';
      } else {
        _subType = 'Voltando';
      }
      _label1 = widget.label1!;
      _label2 = widget.label2!;
    });
    return CardTicket(
      type: _subType,
      place: widget.title,
      going: _label1,
      arrival: _label2,
      price: widget.price,
    );
  }
}
