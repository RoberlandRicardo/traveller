import 'dart:convert';

import 'package:traveller/app/database/off_authentication/dao/daoTravel.dart';
import 'package:traveller/app/database/off_authentication/database.dart';
import 'package:traveller/app/models/item_bag.dart';
import 'package:traveller/app/models/travel.dart';

class ControllerTravelOffAuth {
  static insertTravel(Travel travel) async {
    await DatabaseOffAuthentication.beginTransaction();
    await insertTravelDAO(travel);
    await DatabaseOffAuthentication.commit();
  }

  static getTravels() async {
    List<Map> travels = await ((List.from(await getTravelsDAO()))[0]);

    List<Travel> travelFormat = [];
    travels.forEach((travel) {
      Travel objTravel = Travel();
      objTravel.id = travel['idInternal'];
      objTravel.titulo = travel['titulo'];
      objTravel.dataInicio = DateTime.parse(travel['dataInicio']);
      objTravel.dataFim = DateTime.parse(travel['dataFim']);
      objTravel.itemsBag = List<ItemBag>.from(jsonDecode(travel['itemsBag']));
      travelFormat.add(objTravel);
    });

    return travelFormat;
  }
}
