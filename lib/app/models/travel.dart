import 'package:traveller/app/models/item_bag.dart';
import 'package:traveller/app/models/rota.dart';
import 'package:traveller/app/models/usuario.dart';

class Travel {
  static const String idColumn = 'id';
  static const String usuarioColumn = 'usuario';
  static const String tituloColumn = 'titulo';
  static const String dataInicioColumn = 'dataInicio';
  static const String dataFimColumn = 'dataFim';
  static const String ativoColumn = 'ativo';
  static const String itemsBagColumn = 'itemsBag';
  static const String rotasColumn = 'rotas';

  int? id;
  Usuario usuario = Usuario();
  String? titulo;
  DateTime dataInicio = DateTime.now();
  DateTime dataFim = DateTime.now();
  bool ativo = false;
  List<ItemBag> itemsBag = [];
  List<Rota> rotas = [];

  Travel();

  Travel.fromMap(Map map) {
    if (map[idColumn] == null) id = null;
    if (map[tituloColumn] == null) titulo = null;
    dataInicio = map[dataInicioColumn];
    dataFim = map[dataFimColumn];
    ativo = map[ativoColumn];
    itemsBag = map[itemsBagColumn];
    rotas = map[rotasColumn];
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      dataInicioColumn: dataInicio,
      dataFimColumn: dataFim,
      ativoColumn: ativo,
      itemsBagColumn: itemsBag,
      rotasColumn: rotas,
    };
    if (id != null) map[idColumn] = id;
    if (titulo != null) map[tituloColumn] = titulo;
    return map;
  }
}
