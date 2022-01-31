import 'package:flutter/material.dart';
import 'package:traveller/app/models/item_bag.dart';
import 'package:traveller/app/styles/custom_text.dart';

class InputItemBag extends StatelessWidget {
  ItemBag? value;
  final Function action;
  bool _registered = false;

  InputItemBag({ItemBag? value, required this.action}) {
    if (value != null) {
      this.value = value;
      _registered = true;
    } else
      this.value = new ItemBag();
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Flexible(
        child: TextField(
          onChanged: (string) {},
          style: CustomText.input,
          decoration: InputDecoration(
            hintText: "Adicione um item para viagem...",
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
            filled: true,
            fillColor: Color.fromRGBO(233, 230, 230, 1),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _registered
                ? Color.fromRGBO(151, 21, 3, 1)
                : Theme.of(context).colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: _registered
              ? GestureDetector(
                  onTap: () => action(value),
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.background,
                    size: 32,
                  ),
                )
              : GestureDetector(
                  onTap: () => action(value),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.background,
                    size: 34,
                  ),
                )),
    ]);
  }
}
