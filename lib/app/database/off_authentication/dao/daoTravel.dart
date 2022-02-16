import 'dart:convert';

import 'package:traveller/app/database/off_authentication/database.dart';
import 'package:traveller/app/models/travel.dart';

insertTravelDAO(Travel travel) async {
  return DatabaseOffAuthentication.getDb().then((db) => {
        db?.execute(
            "INSERT OR REPLACE INTO travel(titulo, dataInicio, dataFim, ativo, itemsBag) VALUES(?, ?, ?, ? ,?);",
            [
              travel.titulo,
              travel.dataInicio.toString(),
              travel.dataFim.toString(),
              travel.ativo,
              jsonEncode(travel.itemsBag)
            ])
      });
}

getTravelsDAO() async {
  return DatabaseOffAuthentication.getDb().then((db) => {
        db?.query('travel'),
      });
}
