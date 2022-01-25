import 'package:flutter/widgets.dart';

class GenericModal extends StatefulWidget {
  final String title;
  final Icon icon;

  GenericModal({required this.title, required this.icon});

  @override
  State<GenericModal> createState() => _GenericModalState();
}

class _GenericModalState extends State<GenericModal> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
