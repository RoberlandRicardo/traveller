import 'package:traveller/app/models/travel.dart';

class Usuario {
  static const String idColumn = 'id';
  static const String usernameColumn = 'username';
  static const String passwordColumn = 'password';
  static const String firstnameColumn = 'first_name';
  static const String lastnameColumn = 'last_name';
  static const String emailColumn = 'email';
  static const String travelsColumn = 'travels';
  int? id;
  String username = '';
  String password = '';
  String firstname = '';
  String? lastname;
  String email = '';
  List<Travel> travels = [];

  Usuario();

  Usuario.fromSessao(
      {required this.id,
      required this.username,
      required this.firstname,
      this.lastname,
      required this.email});

  Usuario.fromMap(Map map) {
    if (map.containsKey(idColumn))
      id = map[idColumn];
    else
      id = null;
    username = map[usernameColumn];
    firstname = map[firstnameColumn];
    if (map.containsKey(lastnameColumn))
      lastname = map[lastnameColumn];
    else
      lastname = null;
    email = map[emailColumn];
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      usernameColumn: username,
      passwordColumn: password,
      firstnameColumn: firstname,
      lastnameColumn: lastname,
      emailColumn: email,
    };
    if (id != null) map[idColumn] = id;
    if (lastname != null) map[lastnameColumn] = lastname;
    return map;
  }
}
