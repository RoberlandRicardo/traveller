import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/api/api.dart';
import 'package:traveller/app/api/routes/travel.dart';
import 'package:traveller/app/components/card/card_rota.dart';
import 'package:traveller/app/components/custom_button_01.dart';
import 'package:traveller/app/components/generic_screen_nivel03.dart';
import 'package:traveller/app/components/input/input_item_bag.dart';
import 'package:traveller/app/database/off_authentication/controller/controllerTravel.dart';
import 'package:traveller/app/models/item_bag.dart';
import 'package:traveller/app/components/modal/modal_rota.dart';
import 'package:traveller/app/components/pagination_01.dart';
import 'package:traveller/app/models/sessao.dart';
import 'package:traveller/app/models/travel.dart';
import 'package:traveller/app/stores/actions.dart';
import 'package:traveller/app/stores/app_state.dart';
import 'package:traveller/app/styles/custom_text.dart';
import 'package:traveller/app/models/rota.dart';
import 'package:traveller/app/util/extensionFunctions.dart';

class Campos extends StatefulWidget {
  @override
  State<Campos> createState() => _CamposState();
}

class _CamposState extends State<Campos> {
  final TextEditingController tituloControler = TextEditingController();
  final TextEditingController dataInicioControler = TextEditingController();
  final TextEditingController dataFimControler = TextEditingController();

  @override
  void initState() {
    super.initState();
    appStore.dispatcher(action: AppAction.initTravelCadastro);
  }

  @override
  void dispose() {
    appStore.dispatcher(action: AppAction.closeTravelCadastro);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      title: "Cadastro de viagem",
      floactingActionButtonFunction: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Rotas()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Pagination(currentIndex: 0, total: 3),
              SizedBox(height: 25),
              Text(
                "Qual nome voc?? daria para essa viagem?",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: tituloControler,
                style: CustomText.input,
                onChanged: (string) {
                  Travel travelCadastro = appStore.state.travelCadastro!;
                  travelCadastro.titulo = string;

                  appStore.dispatcher(
                      action: AppAction.setTravelCadastro,
                      payload: travelCadastro);
                },
                decoration: InputDecoration(
                    hintText: "Nome viagem",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: CustomText.fontColor))),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Qual sua data de saida e retorno?",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: dataInicioControler,
                style: CustomText.input,
                showCursor: true,
                readOnly: true,
                onTap: () {
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
                    Travel travelCadastro = appStore.state.travelCadastro!;
                    travelCadastro.dataInicio = value ?? DateTime.now();
                    appStore.dispatcher(
                        action: AppAction.setTravelCadastro,
                        payload: travelCadastro);
                    dataInicioControler.text =
                        value.toStringBR(format: 'date') ?? "";
                  });
                },
                decoration: InputDecoration(
                    hintText: "Inicio da viagem",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: CustomText.fontColor))),
              ),
              TextField(
                controller: dataFimControler,
                style: CustomText.input,
                showCursor: true,
                readOnly: true,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: appStore.state.travelCadastro!.dataInicio,
                    firstDate: appStore.state.travelCadastro!.dataInicio,
                    lastDate: DateTime(DateTime.now().year + 7),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData(),
                        child: child!,
                      );
                    },
                  ).then((value) {
                    Travel travelCadastro = appStore.state.travelCadastro!;
                    travelCadastro.dataInicio = value ?? DateTime.now();
                    appStore.dispatcher(
                        action: AppAction.setTravelCadastro,
                        payload: travelCadastro);
                    dataFimControler.text =
                        value.toStringBR(format: 'date') ?? "";
                  });
                },
                decoration: InputDecoration(
                    hintText: "Saida da viagem",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: CustomText.fontColor))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Rotas extends StatefulWidget {
  @override
  State<Rotas> createState() => _RotasState();
}

class _RotasState extends State<Rotas> {
  void createRota(BuildContext context) {
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        enableDrag: false,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
            bottom: Radius.circular(20),
          ),
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.95,
        ),
        builder: (builder) {
          return Wrap(children: [
            ModalRota(
              confirmFunction: (rota) {
                Travel travel = appStore.state.travelCadastro!;
                travel.rotas.add(rota);
                appStore.dispatcher(
                    action: AppAction.setTravelCadastro, payload: travel);
                setState(() {});
              },
            )
          ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      title: "Cadastro de viagem",
      floactingActionButtonFunction: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Bag()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Pagination(currentIndex: 1, total: 3),
            SizedBox(height: 25),
            Text(
              "Qual sua rota?",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 25,
            ),
            RichText(
              text: TextSpan(
                  text:
                      "Adicione quais os pontos que voc??s deseja visitar, informa????es sobre passagem e hospedagem.\n",
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                    TextSpan(text: "Voc?? esta indo em "),
                    TextSpan(
                        text: appStore.state.travelCadastro!.dataInicio
                            .toStringDateBR(),
                        style: CustomText.buttonOrange),
                    TextSpan(
                      text: " e voltando em ",
                    ),
                    TextSpan(
                        text: appStore.state.travelCadastro!.dataFim
                            .toStringDateBR(),
                        style: CustomText.buttonOrange),
                    TextSpan(
                      text: ".",
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView(children: [
              for (int i = 0;
                  i < appStore.state.travelCadastro!.rotas.length;
                  i++)
                CardRota(
                    last:
                        (i == appStore.state.travelCadastro!.rotas.length - 1),
                    rota: appStore.state.travelCadastro!.rotas[i]),
              SizedBox(
                height: 20,
              ),
              Center(
                child: CustomButton(
                  textButton: "ADICIONE UMA LOCALIZA????O",
                  action: () => createRota(context),
                ),
              ),
            ])),
          ],
        ),
      ),
    );
  }
}

class Bag extends StatefulWidget {
  @override
  State<Bag> createState() => _BagState();
}

class _BagState extends State<Bag> {
  void registerTravel() async {
    if (appStore.state.offAuthentication ??
        appStore.state.offAuthentication == true) {
      await ControllerTravelOffAuth.insertTravel(
          appStore.state.travelCadastro!);
      appStore.state.listTravels?.add(appStore.state.travelCadastro!);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => FinishScreen()));
    } else {
      final response = await Api.enviarRequisicao(
          method: 'POST',
          endpoint: CADASTRAR_TRAVEL(),
          data: appStore.state.travelCadastro!.toMap());
      if (response == null) {
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FinishScreen()));
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      title: "Cadastro de viagem",
      floactingActionButtonFunction: () {
        registerTravel();
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 25,
            ),
            Pagination(currentIndex: 2, total: 3),
            SizedBox(height: 25),
            Text(
              "O que voc?? pretende levar?",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 25,
            ),
            RichText(
              text: TextSpan(
                  text:
                      "Adicione o que voc?? pretende levar para essa viagem. \n",
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                    TextSpan(text: "Voc?? esta indo em "),
                    TextSpan(
                        text: appStore.state.travelCadastro!.dataInicio
                            .toStringDateBR(),
                        style: CustomText.buttonOrange),
                    TextSpan(
                      text: " e voltando em ",
                    ),
                    TextSpan(
                        text: appStore.state.travelCadastro!.dataFim
                            .toStringDateBR(),
                        style: CustomText.buttonOrange),
                    TextSpan(
                      text: ".",
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            for (var itemBag in appStore.state.travelCadastro!.itemsBag)
              Column(
                children: [
                  InputItemBag(
                      value: itemBag,
                      action: (value) => setState(() {
                            appStore.state.travelCadastro!.itemsBag
                                .remove(value);
                          })),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            InputItemBag(
              action: (value) => setState(() {
                Travel? travel = appStore.state.travelCadastro;
                travel!.itemsBag.add(value);
                appStore.dispatcher(
                    action: AppAction.setTravelCadastro, payload: travel);
              }),
            ),
            SizedBox(
              height: 90,
            ),
          ]),
        ),
      ),
    );
  }
}

class FinishScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      title: "Cadastro de viagem",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            SizedBox(
              height: 45,
            ),
            Text(
              "Parab??ns =D",
              style: Theme.of(context).textTheme.headline1,
            ),
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/images/traveling-pana.png',
                width: 380,
                height: 250,
                fit: BoxFit.fitWidth,
              ),
            ),
            Text(
                "Sua viagem foi cadastrada com sucesso. Voc?? pode visualizar suas informa????es na aba de viagem.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1),
            SizedBox(
              height: 35,
            ),
            CustomButton(
                textButton: "??TIMO",
                action: () {
                  Navigator.pushReplacementNamed(context, '/home');
                  appStore.dispatcher(action: AppAction.closeTravelCadastro);
                }),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
