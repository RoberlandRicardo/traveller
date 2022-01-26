import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/styles/custom_text.dart';

class GenericModal extends StatefulWidget {
  final String title;
  final Icon? icon;
  final Widget child;

  GenericModal({required this.title, this.icon, required this.child});

  @override
  State<GenericModal> createState() => _GenericModalState();
}

class _GenericModalState extends State<GenericModal> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  widget.icon!,
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headline3,
                  )
                ],
              ),
            ),
            widget.child,
            Align(
              alignment: Alignment.bottomRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: [
                          TextSpan(
                              text: "CANCELAR",
                              style:
                                  TextStyle(color: CustomText.fontColorOrange))
                        ])),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: [
                          TextSpan(
                              text: "CONFIRMAR",
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary))
                        ])),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
