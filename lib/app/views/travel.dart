import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traveller/app/components/card/card_travel.dart';
import 'package:traveller/app/components/generic_screen_nivel02.dart';
import 'package:traveller/app/components/card/card_rota_travel.dart';
import 'package:traveller/app/models/travel.dart';
import 'package:traveller/app/stores/app_state.dart';
import 'package:traveller/app/styles/custom_text.dart';
import 'package:traveller/app/util/extensionFunctions.dart';

class PageTravels extends StatefulWidget {
  const PageTravels({Key? key}) : super(key: key);

  @override
  _PageTravelsState createState() => _PageTravelsState();
}

class _PageTravelsState extends State<PageTravels> {
  Travel? activeTravel;

  @override
  void initState() {
    super.initState();
    activeTravel =
        appStore.state.listTravels.firstWhereOrNull((travel) => travel.ativo);
  }

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
                    activeTravel == null
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
          body: activeTravel == null ? getWidgetNotTravel() : getWidgetTravel(),
          drawer: getDrawer()),
    );
  }

  @override
  bool get wantKeepAlive => throw UnimplementedError();

  Drawer getDrawer() {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 60,
            child: DrawerHeader(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black26))),
              child: Text(
                "Viagens cadastradas",
                style: TextStyle(
                    fontSize: 18,
                    color: CustomText.fontColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          for (Travel t in appStore.state.listTravels!)
            CardTravel(titulo: t.titulo, data: t.dataInicio)
        ],
      ),
    );
  }

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
          ],
        ));
  }
}
