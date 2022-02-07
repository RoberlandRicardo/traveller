import 'package:flutter/material.dart';
import 'package:traveller/app/api/api.dart';
import 'package:traveller/app/api/routes/autenticacao.dart';
import 'package:traveller/app/components/generic_screen_nivel01.dart';
import 'package:traveller/app/components/input/input_01.dart';
import 'package:traveller/app/styles/custom_text.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String _username = '';
  String _password = '';

  Future<void> login() async {
    var response = await Api.enviarRequisicao(
        method: "POST",
        endpoint: LOGIN(),
        data: {'username': _username, 'password': _password});

    if (response == null) {
    } else if (response.statusCode >= 200 && response.statusCode < 300) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      textFirstButton: "ENTRAR",
      textSecondButton: "AINDA NÃO TENHO CONTA",
      functionFirstButton: () => login(),
      functionSecondButton: () =>
          {Navigator.pushReplacementNamed(context, '/cadastro')},
      functionHomeButton: () {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          children: [
            Text(
              "Bem vindo de volta!",
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(19, 19, 19, 1)),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Faça login para continuar no Traveller",
              style:
                  TextStyle(fontSize: 16, color: Color.fromRGBO(19, 19, 19, 1)),
            ),
            SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Input(
                      controller: usernameController,
                      label: "Usuário",
                      placeholder: "Digite seu usuário",
                      onChanged: (value) {
                        setState(() {
                          _username = value;
                        });
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Input(
                      controller: passwordController,
                      label: "Senha",
                      placeholder: "Digite sua senha",
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      }),
                  SizedBox(
                    height: 15,
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.96,
                    child: GestureDetector(
                      onTap: () => {},
                      child: Text(
                        "Esqueci minha senha",
                        style: TextStyle(
                            fontFamily: CustomText.fontFamily,
                            color: CustomText.fontColor,
                            decoration: TextDecoration.underline),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
