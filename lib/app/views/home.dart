import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _state = 'not_travel';
  String location = 'Rio Grande do Norte, Brasil';
  String name = 'Fulano';
  String _coin = '5,23';
  String _hour = '17:24';
  String _date = '02/01/2022';
  String _temperature = '12 C';
  String _time = 'Parcialmente nublado';
  String _countDays = '2 meses, 7 dias e 10 horas';
  String tripName = 'Rio de Janeiro';

  @protected
  @mustCallSuper
  void initState() {
    calcDate();
  }

  infoTravel() {}

  calcDate() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  Text(location)
                ]),
              ),
              Spacer(),
              Container(
                  width: 45.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  )),
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
                        'Olá,',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 34),
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 34),
                      ),
                    ]),
              ),
              Spacer(),
              if (_state == 'travel')
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Dolár americano'),
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
          if (_state == 'not_travel')
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
    ));
  }

  @override
  bool get wantKeepAlive => throw UnimplementedError();

  getWidgetTextTop() {
    if (_state == 'travel') {
      return Container(
        child: Column(children: [
          Text(
            'Veja informações sobre sua viagem',
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
    } else if (_state == 'before_travel') {
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
    if (_state == 'travel') {
      return Row(
        children: [
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Horário do local'),
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
    } else if (_state == 'before_travel') {
      return Container(
        child: Column(children: [
          Text(
            'Para',
          ),
          Text(
            tripName,
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
            'Você não possui nenhuma viagem ativa no momento.',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Clique aqui",
                style: TextStyle(
                    color: Color.fromRGBO(244, 54, 27, 1),
                    fontWeight: FontWeight.bold),
              ),
              Text(" e cadastre uma nova.")
            ],
          )
        ]),
      );
    }
  }
}
