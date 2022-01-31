import 'package:traveller/app/models/endereco.dart';
import 'package:traveller/app/views/travel.dart';

abstract class Rota {
  static const String idColumn = 'id';
  static const String travelColumn = 'travel';
  static const String dataColumn = 'data';
  static const String precoColumn = 'preco';
  static const String enderecoColumn = 'endereco';

  int? id;
  Travel travel = Travel();
  DateTime data = DateTime.now();
  double? preco;
  Endereco endereco = Endereco();

  Rota();
}
