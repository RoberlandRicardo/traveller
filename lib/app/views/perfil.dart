import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:traveller/app/api/api.dart';
import 'package:traveller/app/api/consts.dart';
import 'package:traveller/app/api/routes/usuario.dart';
import 'package:traveller/app/components/generic_screen_nivel02.dart';
import 'package:traveller/app/stores/actions.dart';
import 'package:traveller/app/stores/app_state.dart';
import 'package:traveller/app/styles/custom_text.dart';
import 'package:image_picker/image_picker.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final Map<String, Function> _buttonNames = {
    'Ajuda': () {},
    'Alterar meus dados': () {},
    'Gerenciar notificações': () {},
    'Privacidade': () {},
    'Sobre': () {},
    'Créditos': () {},
    'Sair': (BuildContext context) {
      appStore.dispatcher(action: AppAction.removeSessao);
      Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
    },
  };

  @override
  void initState() {
    super.initState();
  }

  Future<void> sendPhoto() async {
    File? imageFile;
    ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    imageFile = (File(image!.path));

    Map<String, String> headers = {
      'Authorization': 'Token ' + appStore.state.sessao!.token
    };
    final uri = Uri.parse(url + FOTO());
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath("photo", image.path));
    var response = await request.send();

    if (response == null) {
    } else if (response.statusCode >= 200 && response.statusCode < 300) {
      response.stream.transform(utf8.decoder).listen((value) {
        final Map<String, dynamic> bodyResponse = Map.from(jsonDecode(value));

        appStore.dispatcher(
            action: AppAction.setFoto, payload: bodyResponse["photo"]);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      currendIndex: 2,
      child: SingleChildScrollView(
          child: appStore.state.offAuthentication != null &&
                  appStore.state.offAuthentication == true
              ? notAuth(context)
              : auth(context)),
    );
  }

  Widget ButtonConf(String key, Function function, BuildContext context) {
    return GestureDetector(
      onTap: () => {function(context)},
      child: SizedBox(
        height: 60,
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            decoration: BoxDecoration(
                border: key == 'Sair'
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
                    key,
                    style: key == 'Sair'
                        ? TextStyle(
                            fontSize: CustomText.fontSizeBody,
                            fontFamily: CustomText.fontFamily,
                            color: Color.fromRGBO(244, 54, 27, 1))
                        : Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    child: key == 'Sair'
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

  Widget auth(context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        GestureDetector(
            onTap: () async {
              sendPhoto();
            },
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
                ))),
        SizedBox(
          height: 10,
        ),
        Text(
            appStore.state.sessao == null
                ? 'fulano'
                : appStore.state.sessao!.firstname,
            style: Theme.of(context).textTheme.headline1),
        Text(
            appStore.state.locationUser == null
                ? "Carregando localização..."
                : appStore.state.locationUser!.cidade +
                    ", " +
                    appStore.state.locationUser!.pais,
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
                      .map((name, function) {
                        return MapEntry(
                            name, ButtonConf(name, function, context));
                      })
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
          height: 35,
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
          width: 300.0,
          height: 300.0,
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
                  GestureDetector(
                    onTap: () {
                      appStore.dispatcher(
                          action: AppAction.desactivateOffAuthentication);
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/login', (_) => false);
                    },
                    child: Text("Clique aqui ",
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold)),
                  ),
                  Text("para voltar para tela de login",
                      style: Theme.of(context).textTheme.bodyText1)
                ],
              ),
              Text("e faça a autenticação para salvar seus dados.",
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
        // Spacer(),
      ],
    );
  }
}
