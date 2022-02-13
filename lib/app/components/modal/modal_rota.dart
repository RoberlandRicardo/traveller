import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/geocoding.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:traveller/app/api/consts.dart';
import 'package:traveller/app/models/endereco.dart';
import 'package:traveller/app/models/hospedagem.dart';
import 'package:traveller/app/models/travel.dart';
import 'package:traveller/app/stores/app_state.dart';
import 'package:traveller/app/views/select_place.dart';
import 'package:traveller/app/components/input/input_modal_01.dart';
import 'package:traveller/app/components/modal/generic_modal.dart';
import 'package:traveller/app/models/parada.dart';
import 'package:traveller/app/models/rota.dart';

class ModalRota extends StatefulWidget {
  final Function(Rota) confirmFunction;

  const ModalRota({Key? key, required this.confirmFunction}) : super(key: key);

  @override
  State<ModalRota> createState() => _ModalRotaState();
}

class _ModalRotaState extends State<ModalRota> {
  String? _abaModal = "Parada";
  Rota? _rota;

  @override
  void initState() {
    super.initState();
    if (_rota == null)
      setState(() {
        _rota = Parada();
      });
  }

  updateRota(Rota rota) {
    setState(() {
      _rota = rota;
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
                  switch (value) {
                    case 'Parada':
                      _rota = Parada();
                      break;
                    case 'Hospedagem':
                      _rota = Hospedagem();
                      break;
                  }
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
      confirmFunction: () => widget
          .confirmFunction(_rota == null ? throw NullThrownError() : _rota!),
      icon: Icon(
        _abaModal == "Parada"
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
              itemPagination("Parada", context),
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
            child: _abaModal == "Parada"
                ? FormParada(updateRota: updateRota, rota: _rota!)
                : _abaModal == "Hospedagem"
                    ? FormHospedagem(updateRota: updateRota, rota: _rota!)
                    : _abaModal == "Passagem"
                        ? FormPassagem(updateRota: updateRota, rota: _rota!)
                        : SizedBox(),
          ),
        ],
      ),
    );
  }
}

class FormParada extends StatefulWidget {
  final Function updateRota;
  Rota rota;

  FormParada({Key? key, required this.updateRota, required this.rota})
      : super(key: key);

  @override
  State<FormParada> createState() => _FormParadaState();
}

class _FormParadaState extends State<FormParada> {
  final TextEditingController localizacaoController = TextEditingController();

  final TextEditingController dataController = TextEditingController();

  final TextEditingController horarioController = TextEditingController();

  final TextEditingController precoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputModal(
          controller: localizacaoController,
          label: "Localização",
          placeholder: "Digite a localização da sua hospedagem",
          type: 'location',
          onChangedLocation: (Place place) {
            Endereco end = Endereco.fromPlace(place);
            widget.rota.endereco = end;
          },
        ),
        SizedBox(
          height: 15,
        ),
        InputModal(
          controller: dataController,
          label: "Data de chegada",
          placeholder: "Selecione o dia do check in",
          type: 'date',
          onChangedDateTime: (DateTime date) {
            DateTime dateTime = DateTime(date.year, date.month, date.day,
                widget.rota.data.hour, widget.rota.data.minute);
            widget.rota.data = dateTime;
          },
        ),
        InputModal(
          controller: horarioController,
          placeholder: "Selecione o horário do check in",
          type: 'time',
          onChangedDateTime: (DateTime date) {
            DateTime dateTime = DateTime(
                widget.rota.data.year,
                widget.rota.data.month,
                widget.rota.data.day,
                date.hour,
                date.minute);
            widget.rota.data = dateTime;
          },
        ),
        SizedBox(
          height: 15,
        ),
        InputModal(
          controller: precoController,
          label: "Preço",
          placeholder: "Digite o custo do local (opcional)",
          onChanged: (value) {
            widget.rota.preco = value;
          },
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class FormHospedagem extends StatefulWidget {
  final Function updateRota;
  Rota rota;

  FormHospedagem({Key? key, required this.updateRota, required this.rota})
      : super(key: key);

  @override
  State<FormHospedagem> createState() => _FormHospedagemState();
}

class _FormHospedagemState extends State<FormHospedagem> {
  final TextEditingController localizacaoController = TextEditingController();

  final TextEditingController dataInicioController = TextEditingController();

  final TextEditingController horarioInicioController = TextEditingController();

  final TextEditingController dataFimController = TextEditingController();

  final TextEditingController horarioFimController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputModal(
            controller: localizacaoController,
            label: "Localização",
            placeholder: "Digite a localização da sua hospedagem",
            onChanged: (value) {}),
        SizedBox(
          height: 15,
        ),
        InputModal(
          controller: dataInicioController,
          label: "Check in",
          placeholder: "Selecione o dia do check in",
          type: 'date',
          onChangedDateTime: (DateTime date) {
            DateTime dateTime = DateTime(date.year, date.month, date.day,
                widget.rota.data.hour, widget.rota.data.minute);
            widget.rota.data = dateTime;
          },
        ),
        InputModal(
          controller: horarioInicioController,
          placeholder: "Selecione o horário do check in",
          onChanged: (value) {},
        ),
        SizedBox(
          height: 15,
        ),
        InputModal(
          controller: dataFimController,
          label: "Check out",
          placeholder: "Selecione o dia do check out",
          onChanged: (value) {},
        ),
        InputModal(
          controller: horarioFimController,
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

class FormPassagem extends StatefulWidget {
  final Function updateRota;
  Rota rota;

  FormPassagem({Key? key, required this.updateRota, required this.rota})
      : super(key: key);

  @override
  State<FormPassagem> createState() => _FormPassagemState();
}

class _FormPassagemState extends State<FormPassagem> {
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
