import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/components/card/card_rota.dart';
import 'package:traveller/app/components/custom_button_01.dart';
import 'package:traveller/app/components/generic_screen_nivel03.dart';
import 'package:traveller/app/components/input/input_item_bag.dart';
import 'package:traveller/app/models/item_bag.dart';
import 'package:traveller/app/components/modal/modal_rota.dart';
import 'package:traveller/app/components/pagination_01.dart';
import 'package:traveller/app/styles/custom_text.dart';
import 'package:traveller/app/models/rota.dart';

class Campos extends StatelessWidget {
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
                "Qual nome você daria para essa viagem?",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                style: CustomText.input,
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
                style: CustomText.input,
                decoration: InputDecoration(
                    hintText: "Inicio da viagem",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: CustomText.fontColor))),
              ),
              TextField(
                style: CustomText.input,
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
  List<Rota> rotas = [];

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
                setState(() {
                  rotas.add(rota);
                });
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
                      "Adicione quais os pontos que vocês deseja visitar, informações sobre passagem e hospedagem.\n",
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                    TextSpan(text: "Você esta indo em "),
                    TextSpan(
                        text: "00/00/0000 ", style: CustomText.buttonOrange),
                    TextSpan(
                      text: "e voltando em ",
                    ),
                    TextSpan(
                        text: "00/00/0000", style: CustomText.buttonOrange),
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
              for (int i = 0; i < rotas.length; i++)
                CardRota(last: (i == rotas.length - 1)),
              SizedBox(
                height: 20,
              ),
              Center(
                child: CustomButton(
                  textButton: "ADICIONE UMA LOCALIZAÇÃO",
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
  List<ItemBag> itemsBag = [];

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      title: "Cadastro de viagem",
      floactingActionButtonFunction: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FinishScreen()));
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
              "O que você pretende levar?",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 25,
            ),
            RichText(
              text: TextSpan(
                  text:
                      "Adicione o que você pretende levar para essa viagem. \n",
                  style: Theme.of(context).textTheme.bodyText1,
                  children: [
                    TextSpan(text: "Você esta indo em "),
                    TextSpan(
                        text: "00/00/0000 ", style: CustomText.buttonOrange),
                    TextSpan(
                      text: "e voltando em ",
                    ),
                    TextSpan(
                        text: "00/00/0000", style: CustomText.buttonOrange),
                    TextSpan(
                      text: ".",
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            for (var itemBag in itemsBag)
              Column(
                children: [
                  InputItemBag(
                      value: itemBag,
                      action: (value) => setState(() {
                            itemsBag.remove(value);
                          })),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            InputItemBag(
              action: (value) => setState(() {
                itemsBag.add(value);
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
              "Parabéns =D",
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
                "Sua viagem foi cadastrada com sucesso. Você pode visualizar suas informações na aba de viagem.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1),
            SizedBox(
              height: 35,
            ),
            CustomButton(
                textButton: "ÓTIMO",
                action: () => Navigator.pushReplacementNamed(context, '/home')),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
