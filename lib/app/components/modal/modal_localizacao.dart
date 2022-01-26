import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/components/input/input_modal_01.dart';
import 'package:traveller/app/components/modal/generic_modal.dart';

class ModalLocalizacao extends StatefulWidget {
  @override
  State<ModalLocalizacao> createState() => _ModalLocalizacaoState();
}

class _ModalLocalizacaoState extends State<ModalLocalizacao> {
  String? _abaModal;

  Widget itemPagination(String title, BuildContext context) {
    return Row(
      children: [
        Transform.scale(
            scale: 1.3,
            child: Radio<String>(
              value: title,
              groupValue: _abaModal,
              activeColor: Theme.of(context).colorScheme.background,
              onChanged: (String? value) {
                setState(() {
                  _abaModal = value;
                });
              },
            )),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GenericModal(
      icon: Icon(
        Icons.location_on,
        size: 30,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              itemPagination("Rota", context),
              itemPagination("Hospedagem", context),
              itemPagination("Passagem", context),
              SizedBox(
                width: 2,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          _abaModal == "Rota" ? FormRota() : SizedBox(),
        ],
      ),
      title: "Rota",
    );
  }
}

class FormRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputModal(label: "Localização", onChanged: (value) {}),
        SizedBox(
          height: 15,
        ),
        InputModal(
          label: "Data de chegada",
          placeholder: "Selecione o dia do check in",
          onChanged: (value) {},
        ),
        InputModal(
          placeholder: "Selecione o horário do check in",
          onChanged: (value) {},
        ),
      ],
    );
  }
}
