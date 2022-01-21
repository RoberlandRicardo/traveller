import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/components/generic_screen_nivel02.dart';
import 'package:traveller/app/styles/custom_text.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      currendIndex: 2,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: CustomText.fontColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
