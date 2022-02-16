import 'package:traveller/app/models/accommodation.dart';
import 'package:traveller/app/models/backpack_item.dart';
import 'package:traveller/app/models/hospedagem.dart';
import 'package:traveller/app/models/item_bag.dart';
import 'package:traveller/app/models/route.dart';
import 'package:traveller/app/models/ticket.dart';
import 'package:traveller/app/models/rota.dart';
import 'package:traveller/app/models/usuario.dart';

// class TravelApi {
//   static const String idColumn = 'id';
//   static const String usuarioColumn = 'user';
//   static const String tituloColumn = 'title';
//   static const String dataInicioColumn = 'date_start';
//   static const String dataFimColumn = 'date_end';
//   static const String ativoColumn = 'active';
//   static const String itemsBagColumn = 'backpack_items';
//   static const String rotasColumn = 'routes';
//   static const String hospedagensColumn = 'accommodations';
//   static const String passagensColumn = 'tickets';

//   int id = 0;
//   Usuario usuario = Usuario();
//   String titulo = '';
//   String dataInicio = '';
//   String dataFim = '';
//   bool ativo = false;
//   List<ItemBag> itemsBag = [];
//   List<Rota> rotas = [];
//   List<Hospedagem> hospedagens = [];
//   List<Passagem> passagens = [];

//   TravelApi();

//   TravelApi.fromMap(Map map) {
//     id = map[idColumn];
//     titulo = map[tituloColumn];
//     dataInicio = map[dataInicioColumn];
//     dataFim = map[dataFimColumn];
//     ativo = map[ativoColumn];
//     itemsBag = map[itemsBagColumn];
//     rotas = map[rotasColumn];
//     hospedagens = map[hospedagensColumn];
//     passagens = map[passagensColumn];
//   }

//   Map<String, Object?> toMap() {
//     Map<String, Object?> map = {
//       dataInicioColumn: dataInicio,
//       dataFimColumn: dataFim,
//       ativoColumn: ativo,
//       itemsBagColumn: itemsBag,
//       rotasColumn: rotas,
//       hospedagensColumn: hospedagens,
//       passagensColumn: passagens
//     };
//     if (id != 0) map[idColumn] = id;
//     if (titulo != '') map[tituloColumn] = titulo;
//     return map;
//   }
// }
class TravelApi {
  // TravelApi({
  //   this.title,
  //   this.dateStart,
  //   this.dateEnd,
  //   this.active,
  //   this.user,
  //   this.id,
  //   this.routes,
  //   this.accommodations,
  //   this.tickets,
  //   this.backpackItems,
  // });
  TravelApi({
    required this.title,
    required this.dateStart,
    required this.dateEnd,
    required this.active,
    required this.user,
    required this.id,
    this.routes,
    this.accommodations,
    this.tickets,
    this.backpackItems,
  });

  String title;
  DateTime dateStart;
  DateTime dateEnd;
  bool active;
  int user;
  int id;
  List<Route>? routes = [];
  List<Accommodation>? accommodations = [];
  List<Ticket>? tickets = [];
  List<BackpackItem>? backpackItems = [];

  factory TravelApi.fromJson(Map<String, dynamic> json) => TravelApi(
        title: json["title"],
        dateStart: DateTime.parse(json["date_start"]),
        dateEnd: DateTime.parse(json["date_end"]),
        active: json["active"],
        user: json["user"],
        id: json["id"],
        routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
        accommodations: List<Accommodation>.from(
            json["accommodations"].map((x) => Accommodation.fromJson(x))),
        tickets:
            List<Ticket>.from(json["tickets"].map((x) => Ticket.fromJson(x))),
        backpackItems: List<BackpackItem>.from(
            json["backpack_items"].map((x) => BackpackItem.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "title": title,
  //       "date_start":
  //           "${dateStart.year.toString().padLeft(4, '0')}-${dateStart.month.toString().padLeft(2, '0')}-${dateStart.day.toString().padLeft(2, '0')}",
  //       "date_end":
  //           "${dateEnd.year.toString().padLeft(4, '0')}-${dateEnd.month.toString().padLeft(2, '0')}-${dateEnd.day.toString().padLeft(2, '0')}",
  //       "active": active,
  //       "user": user,
  //       "id": id,
  //       "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
  //       "accommodations":
  //           List<dynamic>.from(accommodations.map((x) => x.toJson())),
  //       "tickets": List<dynamic>.from(tickets.map((x) => x.toJson())),
  //       "backpack_items":
  //           List<dynamic>.from(backpackItems.map((x) => x.toJson())),
  //     };
}
