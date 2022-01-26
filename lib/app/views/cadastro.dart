import 'package:flutter/material.dart';
import 'package:traveller/app/components/generic_screen_nivel01.dart';
import 'package:traveller/app/components/input/input_01.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String _name = '';
  String _username = '';
  String _password = '';
  String _repeatPassword = '';
  String _email = '';

  Future<void> register() async {
    var name = _name.split(" ");
    debugPrint('funçãoooo $name');
    const localhost = '127.0.0.1';
    const request = 'http://localhost:8000/traveller/register';
    debugPrint('testeeeee $request');
    http.Response response = await http.post(Uri.parse(request), body: {
      "first_name": name[0],
      "last_name": name[1],
      "username": _username,
      "password": _password,
      "email": _email,
    });
    if (response.statusCode == 201) {
      debugPrint('okkkkkkkkkk $response');
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      debugPrint('responseeeeeeeeeeeeeeeee $response');
    }
    // try {
    //   http.Response response = await http.post(Uri.parse(request), body: {
    //     "first_name": name[0],
    //     "last_name": name[1],
    //     "username": _username,
    //     "password": _password,
    //     "email": _email,
    //   });
    //   if (response.statusCode == 201) {
    //     debugPrint('okkkkkkkkkk $response');
    //     Navigator.pushReplacementNamed(context, '/login');
    //   } else {
    //     debugPrint('responseeeeeeeeeeeeeeeee $response');
    //   }
    // } catch (erro) {
    //   debugPrint('eerooo');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GenericScreen(
      textFirstButton: "CRIAR CONTA",
      textSecondButton: "EU JÁ POSSUO CONTA",
      functionFirstButton: () => {register()},
      functionSecondButton: () => {},
      functionHomeButton: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Column(
          children: [
            Text(
              "Cadastro",
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(19, 19, 19, 1)),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Planeje suas viagens no Traveller',
              style:
                  TextStyle(fontSize: 16, color: Color.fromRGBO(19, 19, 19, 1)),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Input(
                        label: "Nome",
                        placeholder: "Digite seu nome completo",
                        onChanged: (value) {
                          setState(() {
                            _name = value;
                          });
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Input(
                        label: "Usuário",
                        placeholder: "Digite um usuário",
                        onChanged: (value) {
                          setState(() {
                            _username = value;
                          });
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Input(
                        label: "Senha",
                        placeholder: "Digite uma senha",
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Input(
                        label: "Repita sua senha",
                        placeholder: "Digite uma senha novamente",
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    Input(
                        label: "Email",
                        placeholder: "Digite seu email",
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        }),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
