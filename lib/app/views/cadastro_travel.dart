import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/components/card/card_localizacao.dart';
import 'package:traveller/app/components/custom_button_01.dart';
import 'package:traveller/app/components/generic_screen_nivel03.dart';
import 'package:traveller/app/components/modal/modal_localizacao.dart';
import 'package:traveller/app/components/pagination_01.dart';
import 'package:traveller/app/styles/custom_text.dart';
import 'package:traveller/app/models/localizacao.dart';

class Campos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      title: "Cadastro de viagem",
      floactingActionButtonFunction: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Localizacaos()));
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

class Localizacaos extends StatefulWidget {
  @override
  State<Localizacaos> createState() => _LocalizacaosState();
}

class _LocalizacaosState extends State<Localizacaos> {
  List<Localizacao> localizacaos = [];

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
            ModalLocalizacao(
              confirmFunction: (localizacao) {
                setState(() {
                  localizacaos.add(localizacao);
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
              for (int i = 0; i < localizacaos.length; i++)
                CardLocalizacao(last: (i == localizacaos.length - 1)),
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
  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      title: "Cadastro de viagem",
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                text: "Adicione o que você pretende levar para essa viagem. \n",
                style: Theme.of(context).textTheme.bodyText1,
                children: [
                  TextSpan(text: "Você esta indo em "),
                  TextSpan(text: "00/00/0000 ", style: CustomText.buttonOrange),
                  TextSpan(
                    text: "e voltando em ",
                  ),
                  TextSpan(text: "00/00/0000", style: CustomText.buttonOrange),
                  TextSpan(
                    text: ".",
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}
