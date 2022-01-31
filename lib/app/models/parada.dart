import 'package:traveller/app/models/rota.dart';

class Parada extends Rota {
  Parada();

  Parada.fromMap(Map map) {
    if (map[Rota.idColumn] == null) id = null;
    if (map[Rota.precoColumn] == null) preco = null;
    travel = map[Rota.travelColumn];
    data = map[Rota.dataColumn];
    endereco = map[Rota.enderecoColumn];
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      Rota.travelColumn: travel,
      Rota.dataColumn: data,
      Rota.enderecoColumn: endereco,
    };
    if (id != null) map[Rota.idColumn] = id;
    if (preco != null) map[Rota.precoColumn] = preco;
    return map;
  }
}
