import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/styles/custom_text.dart';
import 'package:traveller/app/views/home.dart';

class GenericScreen extends StatelessWidget {
  final Widget child;
  final String title;
  final Function? floactingActionButtonFunction;

  GenericScreen({
    required this.child,
    required this.title,
    this.floactingActionButtonFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: CustomText.topBar,
          ),
          iconTheme: IconThemeData(
            color: CustomText.topBar.color, //change your color here
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          titleSpacing: 0,
        ),
        floatingActionButton: floactingActionButtonFunction != null
            ? FloatingActionButton(
                onPressed: () => floactingActionButtonFunction!(),
                child: Icon(
                  Icons.arrow_forward,
                  color: CustomText.fontColorTopBar,
                  size: 30,
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
              )
            : null,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: child,
        ),
        backgroundColor: Theme.of(context).colorScheme.background);
  }
}
