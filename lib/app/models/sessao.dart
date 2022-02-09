import 'package:traveller/app/models/usuario.dart';

class Sessao extends Usuario {
  String token;

  Sessao(
      {required this.token,
      id,
      username = '',
      firstname = '',
      lastname,
      email = ''})
      : super.fromSessao(
            id: id,
            username: username,
            firstname: firstname,
            lastname: lastname,
            email: email);
}
