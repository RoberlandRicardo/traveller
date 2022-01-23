import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traveller/app/components/generic_screen_nivel02.dart';
import 'package:traveller/app/styles/custom_text.dart';

class Perfil extends StatelessWidget {
  String state = 'not_auth';
  static const List<String> _buttonNames = <String>[
    'Ajuda',
    'Alterar meus dados',
    'Gerenciar notificações',
    'Privacidade',
    'Sobre',
    'Créditos',
    'Sair',
  ];

  Widget ButtonConf(String name, int index, BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 60,
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            decoration: BoxDecoration(
                border: index == _buttonNames.length - 1
                    ? null
                    : Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(196, 196, 196, 1)))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: index == _buttonNames.length - 1
                        ? TextStyle(
                            fontSize: CustomText.fontSizeBody,
                            fontFamily: CustomText.fontFamily,
                            color: Color.fromRGBO(244, 54, 27, 1))
                        : Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    child: index == _buttonNames.length - 1
                        ? null
                        : Icon(
                            Icons.navigate_next,
                            size: 30,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      currendIndex: 3,
      child: SingleChildScrollView(
          child: state == 'auth' ? auth(context) : notAuth(context)),
    );
  }

  Widget auth(context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: CustomText.fontColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text("Fulano Smith", style: Theme.of(context).textTheme.headline1),
        Text("Rio Grande do Norte, Brasil",
            style: Theme.of(context).textTheme.subtitle1),
        SizedBox(
          height: 20,
        ),
        FractionallySizedBox(
            widthFactor: 0.9,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Color.fromRGBO(233, 230, 230, 1),
              ),
              child: Column(
                children: <Widget>[
                  ..._buttonNames
                      .asMap()
                      .map((index, name) =>
                          MapEntry(index, ButtonConf(name, index, context)))
                      .values
                      .toList()
                ],
              ),
            )),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget notAuth(context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Container(
          child: Column(
            children: [
              Text('Você não fez o login =(',
                  style: Theme.of(context).textTheme.headline1),
              Text('Você não fez a autenticação',
                  style: Theme.of(context).textTheme.bodyText1)
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        SvgPicture.asset(
          'assets/svgs/not_auth.svg',
          width: 320.0,
          height: 320.0,
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Clique aqui ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold)),
                  Text('e crie uma conta para salvar seus dados,',
                      style: Theme.of(context).textTheme.bodyText1)
                ],
              ),
              Text('personalizar seu perfil e visualizar o feed.',
                  style: Theme.of(context).textTheme.bodyText1)
            ],
          ),
        ),
        // Spacer(),
      ],
    );
  }
}
