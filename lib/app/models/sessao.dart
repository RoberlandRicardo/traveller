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

  Sessao.fromUsuario({required this.token, required Usuario usuario}) {
    super.username = usuario.username;
    super.email = usuario.email;
    super.firstname = usuario.firstname;
    super.lastname = usuario.lastname;
    if (usuario.id != null) super.id = usuario.id;
  }
}
