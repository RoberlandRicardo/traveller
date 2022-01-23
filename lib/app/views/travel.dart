import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traveller/app/components/generic_screen_nivel02.dart';
import 'package:traveller/app/components/card/card_travel.dart';

class Travel extends StatefulWidget {
  const Travel({Key? key}) : super(key: key);

  @override
  _TravelState createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  String state = 'not_travel';
  // String _textButton = 'CADASTRAR VIAGEM';

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      currendIndex: 1,
      child: Scaffold(
        bottomNavigationBar: Material(
          color: Color.fromRGBO(245, 170, 82, 1),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/cadastroTravel');
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Color.fromRGBO(5, 41, 60, 1))),
              ),
              height: kToolbarHeight,
              width: double.infinity,
              child: Center(
                child: Text(
                  state == 'travel'
                      ? 'CADASTRAR VIAGEM'
                      : 'ADICIONAIS MAIS ITENS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromRGBO(5, 41, 60, 1)),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(245, 170, 82, 1),
        body: state == 'travel' ? getWidgetNotTravel() : getWidgetTravel(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => throw UnimplementedError();

  getWidgetNotTravel() {
    return Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Spacer(),
            SvgPicture.asset(
              'assets/svgs/scrapbooking.svg',
              width: 320.0,
              height: 320.0,
            ),
            Container(
              child: Column(children: [
                Text('Você não cadastrou'),
                Text('nenhuma viagem.'),
              ]),
            ),
            Spacer(),
          ],
        ));
  }

  getWidgetTravel() {
    return Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Rio de Janeiro',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text('13/04/2022 - 17/04/2022'),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Exibir mapa',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(244, 54, 27, 1),
                    decoration: TextDecoration.underline,
                  ),
                )),
            Center(
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Informações',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ))),
            CardTravel(
              type: 'hospedagem',
              title: 'Hotel Litoral',
              label1: '13/03/2022 - 12:00',
              label2: '17/03/2022 - 14:00',
              price: '900,00',
            ),
            CardTravel(
              type: 'rota',
              title: 'Passeio de barco',
              price: '80,00',
            ),
            CardTravel(
              type: 'passagem',
              subType: 'indo',
              title: 'Rio de Janeiro, RJ',
              label1: '13/03/2022 - 05:00',
              label2: '13/03/2022 - 08:00',
              price: '1.200,00',
            ),
            CardTravel(
              type: 'passagem',
              subType: 'voltando',
              title: 'São Gonçalo, RN',
              label1: '17/03/2022 - 05:00',
              label2: '17/03/2022 - 08:00',
              price: '1.200,00',
            )
          ],
        ));
  }
}
