import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:traveller/app/components/card/card_cadastro_route.dart';
import 'package:traveller/app/components/custom_button_01.dart';
import 'package:traveller/app/components/generic_screen_nivel03.dart';
import 'package:traveller/app/components/pagination_01.dart';
import 'package:traveller/app/styles/custom_text.dart';

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

class Rotas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      title: "Cadastro de viagem",
      floactingActionButtonFunction: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
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
                          text: "00/00/0000.", style: CustomText.buttonOrange),
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: CardRoute(
                  last: false,
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Center(
                child: CustomButton(
                  textButton: "ADICIONE UMA LOCALIZAÇÃO",
                  action: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}