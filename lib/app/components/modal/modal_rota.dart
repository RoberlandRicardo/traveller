import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/components/modal/generic_modal.dart';

class ModalRota extends StatefulWidget {
  @override
  State<ModalRota> createState() => _ModalRotaState();
}

class _ModalRotaState extends State<ModalRota> {
  @override
  Widget build(BuildContext context) {
    return GenericModal(
      icon: Icon(
        Icons.location_on,
        size: 26,
      ),
      title: "Rota",
    );
  }
}
