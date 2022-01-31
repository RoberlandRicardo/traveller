import 'package:traveller/app/models/item_bag.dart';
import 'package:traveller/app/models/usuario.dart';

class Travel {
  static const String idColumn = 'id';
  static const String usuarioColumn = 'usuario';
  static const String tituloColumn = 'titulo';
  static const String dataInicioColumn = 'dataInicio';
  static const String dataFimColumn = 'dataFim';
  static const String ativoColumn = 'ativo';
  static const String itemsBagColumn = 'itemsBag';

  int? id;
  Usuario usuario = Usuario();
  String? titulo;
  DateTime dataInicio = DateTime.now();
  DateTime dataFim = DateTime.now();
  bool ativo = false;
  List<ItemBag> itemsBag = [];

  Travel();

  Travel.fromMap(Map map) {
    if (map[idColumn] == null) id = null;
    if (map[tituloColumn] == null) titulo = null;
    dataInicio = map[dataInicioColumn];
    dataFim = map[dataFimColumn];
    ativo = map[ativoColumn];
    itemsBag = map[itemsBagColumn];
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      dataInicioColumn: dataInicio,
      dataFimColumn: dataFim,
      ativoColumn: ativo,
    };
    if (id != null) map[idColumn] = id;
    if (titulo != null) map[tituloColumn] = titulo;
    return map;
  }
}
