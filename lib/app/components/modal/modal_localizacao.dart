import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/components/input/input_modal_01.dart';
import 'package:traveller/app/components/modal/generic_modal.dart';
import 'package:traveller/app/models/localizacao.dart';

class ModalLocalizacao extends StatefulWidget {
  final Function(Localizacao) confirmFunction;

  const ModalLocalizacao({Key? key, required this.confirmFunction})
      : super(key: key);

  @override
  State<ModalLocalizacao> createState() => _ModalLocalizacaoState();
}

class _ModalLocalizacaoState extends State<ModalLocalizacao> {
  String? _abaModal = "Rota";
  Localizacao? _localizacao;

  @override
  void initState() {
    super.initState();

    if (_localizacao == null)
      setState(() {
        _localizacao = Localizacao(endereco: "Rua", data: DateTime.now());
      });
  }

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
      confirmFunction: () => widget.confirmFunction(
          _localizacao == null ? throw NullThrownError() : _localizacao!),
      icon: Icon(
        _abaModal == "Rota"
            ? Icons.location_on
            : _abaModal == "Hospedagem"
                ? Icons.bed
                : _abaModal == "Passagem"
                    ? Icons.airplanemode_active
                    : null,
        size: 30,
      ),
      title: _abaModal ?? "",
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
          SizedBox(
            height: 500,
            child: _abaModal == "Rota"
                ? FormRota()
                : _abaModal == "Hospedagem"
                    ? FormHospedagem()
                    : _abaModal == "Passagem"
                        ? FormPassagem()
                        : SizedBox(),
          ),
        ],
      ),
    );
  }
}

class FormRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputModal(
            label: "Localização",
            placeholder: "Digite a localização da sua hospedagem",
            onChanged: (value) {}),
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
        SizedBox(
          height: 15,
        ),
        InputModal(
          label: "Preço",
          placeholder: "Digite o custo do local (opcional)",
          onChanged: (value) {},
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class FormHospedagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputModal(
            label: "Localização",
            placeholder: "Digite a localização da sua hospedagem",
            onChanged: (value) {}),
        SizedBox(
          height: 15,
        ),
        InputModal(
          label: "Check in",
          placeholder: "Selecione o dia do check in",
          onChanged: (value) {},
        ),
        InputModal(
          placeholder: "Selecione o horário do check in",
          onChanged: (value) {},
        ),
        SizedBox(
          height: 15,
        ),
        InputModal(
          label: "Check out",
          placeholder: "Selecione o dia do check out",
          onChanged: (value) {},
        ),
        InputModal(
          placeholder: "Selecione o horário do check out",
          onChanged: (value) {},
        ),
        SizedBox(
          height: 15,
        ),
        InputModal(
          label: "Preço",
          placeholder: "Digite o custo do local (opcional)",
          onChanged: (value) {},
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class FormPassagem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InputModal(
            label: "Ida",
            placeholder: "Digite a localização de embarque",
            onChanged: (value) {}),
        InputModal(
          placeholder: "Selecione o dia da ida",
          onChanged: (value) {},
        ),
        InputModal(
          placeholder: "Selecione o horário esperado da ida",
          onChanged: (value) {},
        ),
        InputModal(
          placeholder: "Digite o portão de embarque (opcional)",
          onChanged: (value) {},
        ),
        InputModal(
          placeholder: "Digite o assento (opcional)",
          onChanged: (value) {},
        ),
        SizedBox(
          height: 15,
        ),
        InputModal(
            label: "Volta",
            placeholder: "Digite a localização de chegada (opcional)",
            onChanged: (value) {}),
        InputModal(
          placeholder: "Selecione o dia esperado da volta (opcional)",
          onChanged: (value) {},
        ),
        InputModal(
          placeholder: "Selecione o horário esperado da volta (opcional)",
          onChanged: (value) {},
        ),
        InputModal(
          placeholder: "Digite o portão de embarque (opcional)",
          onChanged: (value) {},
        ),
        InputModal(
          placeholder: "Digite o assento (opcional)",
          onChanged: (value) {},
        ),
        SizedBox(
          height: 15,
        ),
        InputModal(
          label: "Preço",
          placeholder: "Digite o preço das passagens",
          onChanged: (value) {},
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
