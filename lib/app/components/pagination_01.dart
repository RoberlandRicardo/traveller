import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pagination extends StatelessWidget {
  final int currentIndex;
  final int total;

  Widget square(
      int pageIndex, int actualIndex, int total, BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          color: pageIndex >= actualIndex
              ? Theme.of(context).colorScheme.secondary
              : Color.fromRGBO(142, 142, 142, 1),
        ),
        SizedBox(
          child: actualIndex < total - 1
              ? Container(
                  width: 50,
                  height: 2,
                  color: pageIndex >= actualIndex + 1
                      ? Theme.of(context).colorScheme.secondary
                      : Color.fromRGBO(142, 142, 142, 1),
                )
              : null,
        )
      ],
    );
  }

  Pagination({required this.currentIndex, required this.total});
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var i = 0; i < total; i++)
            square(currentIndex, i, total, context)
        ],
      ),
    );
  }
}
