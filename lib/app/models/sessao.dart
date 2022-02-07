import 'package:traveller/app/models/usuario.dart';

class Sessao extends Usuario {
  String token;

  Sessao({required this.token, id, username, firstname, email})
      : super.fromSessao(
            id: id, username: username, firstname: firstname, email: email);
}
