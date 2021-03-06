import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traveller/app/api/api.dart';
import 'package:traveller/app/api/consts.dart';
import 'package:traveller/app/api/routes/usuario.dart';
import 'package:traveller/app/components/generic_screen_nivel02.dart';
import 'package:traveller/app/models/endereco.dart';
import 'package:traveller/app/models/travel.dart';
import 'package:traveller/app/stores/actions.dart';
import 'package:traveller/app/stores/app_state.dart';
import 'package:traveller/app/stores/store.dart';
import 'package:traveller/app/util/location.dart';
import 'package:geocoding/geocoding.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String state = 'not_travel';
  String location = '';
  String name = "";
  String urlImage =
      'https://traveller-back.herokuapp.com' + (appStore.state.foto ?? '');
  String _coin = '5,23';
  String _hour = '17:24';
  String _date = '02/01/2022';
  String _temperature = '12 C';
  String _time = 'Parcialmente nublado';
  String _countDays = '2 meses, 7 dias e 10 horas';
  String? tripName = 'Rio de Janeiro';

  @override
  void initState() {
    super.initState();
    updateCity();
    if (appStore.state.listTravels != null) verifyIsTravelling();
  }

  verifyIsTravelling() {
    appStore.state.listTravels?.forEach((travel) {
      if (travel.ativo) {
        state = 'travelling';
        return;
      }
    });

    if (state == 'travelling') return;
    Travel minTimeTravel = Travel();
    minTimeTravel.dataInicio = DateTime.utc(275760, 09, 13);

    appStore.state.listTravels?.forEach((travel) {
      if (travel.dataInicio.isAfter(DateTime.now())) {
        if (travel.dataInicio.difference(DateTime.now()).abs() <
            minTimeTravel.dataInicio.difference(DateTime.now()).abs()) {
          minTimeTravel = travel;
        }
      }
    });
    if (minTimeTravel.dataInicio == DateTime.utc(275760, 09, 13)) {
      state = 'not_travel';
    } else {
      state = 'before_travel';
      _countDays = minTimeTravel.dataInicio
              .difference(DateTime.now())
              .inDays
              .toString() +
          " dias";
      tripName = minTimeTravel.titulo;
    }
    setState(() {});
  }

  updateCity() async {
    var position = await getLocation();

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      setState(() {
        Endereco endUser = Endereco.fromPlaceMark(placemarks[0], position);
        appStore.dispatcher(
            action: AppAction.setLocationUser, payload: endUser);
      });
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      currendIndex: 0,
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(224, 224, 224, 1),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Row(children: [
                    Icon(Icons.location_on,
                        color: Color.fromRGBO(244, 54, 27, 1)),
                    Text(appStore.state.locationUser == null
                        ? "Carregando localiza????o..."
                        : appStore.state.locationUser!.cidade +
                            ", " +
                            appStore.state.locationUser!.pais)
                  ]),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                )
              ],
            ),
            Spacer(),
            Row(
              children: [
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ol??,',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 34),
                        ),
                        Text(
                          appStore.state.sessao == null
                              ? 'fulano'
                              : appStore.state.sessao!.firstname,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 34),
                        ),
                      ]),
                ),
                Spacer(),
                if (state == 'travel')
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Dol??r americano'),
                          Text(
                            _coin,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          Text('reais')
                        ]),
                  ),
              ],
            ),
            Spacer(),
            getWidgetTextTop(),
            Spacer(),
            if (state == 'not_travel')
              SvgPicture.asset(
                'assets/svgs/journey.svg',
                width: 320.0,
                height: 320.0,
              )
            else
              SvgPicture.asset('assets/svgs/cuate.svg',
                  width: 280.0, height: 280.0),
            Spacer(),
            getWidgetTextBottom(),
            Spacer()
          ],
        ),
      )),
    );
  }

  @override
  bool get wantKeepAlive => throw UnimplementedError();

  getWidgetTextTop() {
    if (state == 'travel') {
      return Container(
        child: Column(children: [
          Text(
            'Veja informa????es sobre sua viagem',
          ),
          Text(
            "clique aqui",
            style: TextStyle(
              color: Color.fromRGBO(244, 54, 27, 1),
              fontWeight: FontWeight.bold,
            ),
          )
        ]),
      );
    } else if (state == 'before_travel') {
      return Container(
        child: Column(children: [
          Text(
            'Faltam',
          ),
          Text(
            _countDays,
            style: TextStyle(
                color: Color.fromRGBO(244, 54, 27, 1),
                fontWeight: FontWeight.bold,
                fontSize: 24),
          )
        ]),
      );
    } else {
      return Container();
    }
  }

  getWidgetTextBottom() {
    if (state == 'travel') {
      return Row(
        children: [
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Hor??rio do local'),
              Text(
                _hour,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(_date),
            ]),
          ),
          Spacer(),
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('Hoje'),
              Text(
                _temperature,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(_time)
            ]),
          ),
        ],
      );
    } else if (state == 'before_travel') {
      return Container(
        child: Column(children: [
          Text(
            'Para',
          ),
          Text(
            tripName ?? "Sua pr??xima viagem",
            style: TextStyle(
                color: Color.fromRGBO(244, 54, 27, 1),
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
        ]),
      );
    } else {
      return Container(
        child: Column(children: [
          Text(
            'Voc?? n??o possui nenhuma viagem futura no momento.',
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/cadastroTravel');
                },
                child: Text(
                  "Clique aqui",
                  style: TextStyle(
                      color: Color.fromRGBO(244, 54, 27, 1),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(" e cadastre uma nova.")
            ],
          )
        ]),
      );
    }
  }
}
