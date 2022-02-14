import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/models/travel.dart';
import 'package:traveller/app/stores/app_state.dart';
import 'package:traveller/app/styles/custom_text.dart';
import 'package:traveller/app/util/extensionFunctions.dart';

class InputModal extends StatelessWidget {
  final String? label;
  final Function? onChanged;
  final Function? onTap;
  final Function? onChangedDateTime;
  final String? placeholder;
  final String? type;
  final TextEditingController? controller;

  InputModal(
      {this.label,
      this.onChanged,
      this.placeholder,
      this.onTap,
      this.type,
      this.onChangedDateTime,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: <Widget>[
            label != null
                ? FractionallySizedBox(
                    widthFactor: 1,
                    child: Text(
                      label!,
                      style: CustomText.labelModal,
                      textAlign: TextAlign.start,
                    ),
                  )
                : SizedBox(),
            TextField(
              controller: controller,
              style: CustomText.inputModal,
              onChanged: (value) => onChanged!(value),
              showCursor: type == 'date' || type == 'time' ? true : false,
              readOnly: type == 'date' || type == 'time' ? true : false,
              onTap: type == 'date'
                  ? () {
                      showDatePicker(
                        context: context,
                        initialDate: appStore.state.travelCadastro!.dataInicio,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 7),
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData(),
                            child: child!,
                          );
                        },
                      ).then((value) {
                        onChangedDateTime!(value);
                        controller!.text =
                            value.toStringBR(format: 'date') ?? "";
                      });
                    }
                  : type == 'time'
                      ? () {
                          showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(data: ThemeData(), child: child!);
                              }).then((value) {
                            onChangedDateTime!(value);
                            DateTime now = DateTime.now();
                            DateTime date = DateTime(now.year, now.month,
                                now.day, value!.hour, value.minute);
                            controller!.text = date.toStringBR(format: 'time');
                          });
                        }
                      : () {
                          onTap!();
                        },
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                  isDense: true,
                  hintText: placeholder ?? "",
                  hintStyle: TextStyle(color: Color.fromRGBO(152, 152, 152, 1)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(165, 165, 165, 1)))),
            ),
          ],
        ),
      ),
    );
  }
}
