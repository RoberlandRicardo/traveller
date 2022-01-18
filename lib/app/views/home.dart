import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _location = 'Rio Grande do Norte, Brasil';

  clickHere() {}

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
                  Text(_location)
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
                        'Fulano',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 34),
                      ),
                    ]),
              ),
              Spacer(),
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Dolár americano'),
                      Text(
                        '5,53',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text('reais')
                    ]),
              ),
            ],
          ),
          Spacer(),
          Container(
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
          ),
          Spacer(),
          SvgPicture.asset(
            'assets/svgs/cuate.svg',
            width: 270.0,
            height: 270.0,
          ),
          Spacer(),
          Row(
            children: [
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Horário do local'),
                      Text(
                        '17:24',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text('02/01/2022'),
                    ]),
              ),
              Spacer(),
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Hoje'),
                      Text(
                        '12 C',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text('Parcialmente nublado')
                    ]),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  @override
  bool get wantKeepAlive => throw UnimplementedError();
}
