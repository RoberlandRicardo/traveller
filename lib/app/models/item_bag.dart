import 'package:traveller/app/views/travel.dart';

class ItemBag {
  static const String travelColumn = 'travel';
  static const String nameColumn = 'name';
  Travel travel = Travel();
  String name = "";

  ItemBag();

  ItemBag.fromMap(Map map) {
    travel = map[travelColumn];
    name = map[nameColumn];
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      travelColumn: travel,
      nameColumn: name,
    };
    return map;
  }
}
