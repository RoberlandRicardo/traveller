import 'dart:convert';

class Route {
  // Route({
  //   this.address,
  //   this.date,
  //   this.hour,
  //   this.notes,
  //   this.price,
  //   this.typeCard,
  //   this.latitude,
  //   this.longitude,
  //   this.travel,
  //   this.id,
  // });
  Route({
    required this.address,
    required this.date,
    required this.hour,
    required this.notes,
    required this.price,
    required this.typeCard,
    required this.latitude,
    required this.longitude,
    required this.travel,
    required this.id,
  });

  String address;
  DateTime date;
  String hour;
  String notes;
  String price;
  String typeCard;
  String latitude;
  String longitude;
  int travel;
  int id;

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        address: json["address"],
        date: DateTime.parse(json["date"]),
        hour: json["hour"],
        notes: json["notes"],
        price: json["price"],
        typeCard: json["type_card"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        travel: json["travel"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "hour": hour,
        "notes": notes,
        "price": price,
        "type_card": typeCard,
        "latitude": latitude,
        "longitude": longitude,
        "travel": travel,
        "id": id,
      };
}
