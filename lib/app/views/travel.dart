import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traveller/app/api/api.dart';
import 'package:traveller/app/api/routes/viagem.dart';
import 'package:traveller/app/components/card/card_travel.dart';
import 'package:traveller/app/components/generic_screen_nivel02.dart';
import 'package:traveller/app/components/card/card_rota_travel.dart';
import 'package:traveller/app/models/travel.dart';
import 'package:traveller/app/models/travel_api.dart';
import 'package:traveller/app/stores/actions.dart';
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

  List<ListItem> items = [];

  @override
  void initState() {
    super.initState();
    activeTravel =
        appStore.state.listTravels.firstWhereOrNull((travel) => travel.ativo);
    getTravels();
  }

  Future<void> getTravels() async {
    final response = await Api.enviarRequisicao(
        method: "GET",
        endpoint: TODAS_VIAGENS(),
        headers: {'Authorization': 'Token ' + appStore.state.sessao!.token});
    if (response == null) {
    } else if (response.statusCode >= 200 && response.statusCode < 300) {
      List<TravelApi> responseBody = List<TravelApi>.from(
          json.decode(response.body).map((x) => TravelApi.fromJson(x)));

      setState(() {
        for (var i = 0; i < responseBody.length; i++) {
          items.add(ItemLists(
              active: responseBody[i].getElementToListAllTravel('active'),
              id: responseBody[i].getElementToListAllTravel('id'),
              title: responseBody[i].getElementToListAllTravel('title')));
        }
      });
    } else {}
  }

  void _activeTravel(String idOnPress) async {
    List<ListItem> copyListTravel = items;

    for (var i = 0; i < items.length; i++) {
      if (items[i].getActive() == true && items[i].getId() != idOnPress) {
        // enviar quisici????o para inativo
        copyListTravel[i] = ItemLists(
          title: copyListTravel[i].getTitle(),
          id: copyListTravel[i].getId(),
          active: false,
        );
      }
      if (items[i].getActive() == false && items[i].getId() == idOnPress) {
        // enviar quisici????o para ativo
        copyListTravel[i] = ItemLists(
          title: copyListTravel[i].getTitle(),
          id: copyListTravel[i].getId(),
          active: true,
        );
      }
    }

    setState(() {
      items = copyListTravel;
    });
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
      child: Column(
        children: <Widget>[
          Center(
              child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Viagens cadastradas",
              style: TextStyle(
                  fontSize: 18,
                  color: CustomText.fontColor,
                  fontWeight: FontWeight.w700),
            ),
          )),
          Divider(height: 1, thickness: 1, color: Colors.black12),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 1, thickness: 1, color: Colors.black12),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return ListTile(
                    title: item.buildTitle(context, index),
                    onTap: () {
                      _activeTravel(item.getId());
                    });
              },
            ),
          ),
          for (Travel t in appStore.state.listTravels ?? [])
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
                Text('Voc?? n??o cadastrou'),
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
                      'Informa????es',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ))),
          ],
        ));
  }
}

class ItemLists implements ListItem {
  String title;
  String id;
  bool active;

  ItemLists({required this.title, required this.id, required this.active});

  @override
  Widget buildTitle(BuildContext context, int index) => Text(title,
      style: TextStyle(
        fontWeight: active ? FontWeight.bold : FontWeight.normal,
      ));

  @override
  String getId() {
    return id;
  }

  @override
  bool getActive() {
    return active;
  }

  @override
  String getTitle() {
    return title;
  }
}

abstract class ListItem {
  Widget buildTitle(BuildContext context, int index);

  String getId() {
    return '';
  }

  bool getActive() {
    return false;
  }

  String getTitle() {
    return '';
  }
}
