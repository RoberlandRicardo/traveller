import 'dart:convert';

class Accommodation {
  // Accommodation({
  //   this.address,
  //   this.checkInDate,
  //   this.checkInHour,
  //   this.checkOutDate,
  //   this.checkOutHour,
  //   this.price,
  //   this.typeCard,
  //   this.latitude,
  //   this.longitude,
  //   this.travel,
  //   this.id,
  //   this.seat,
  //   this.boardingGate,
  // });
  Accommodation({
    required this.address,
    required this.checkInDate,
    required this.checkInHour,
    required this.checkOutDate,
    required this.checkOutHour,
    required this.price,
    required this.typeCard,
    required this.latitude,
    required this.longitude,
    required this.travel,
    required this.id,
    required this.seat,
    required this.boardingGate,
  });
  String address;
  DateTime? checkInDate = null;
  String checkInHour;
  DateTime? checkOutDate = null;
  String checkOutHour;
  String price;
  String typeCard;
  String latitude;
  String longitude;
  int travel;
  int id;
  String seat;
  String boardingGate;

  factory Accommodation.fromJson(Map<String, dynamic> json) => Accommodation(
        address: json["address"] == null ? '' : json["address"],
        checkInDate: json["check_in_date"] == null
            ? null
            : DateTime.parse(json["check_in_date"]),
        checkInHour: json["check_in_hour"] == null ? '' : json["check_in_hour"],
        checkOutDate: json["check_out_date"] == null
            ? null
            : DateTime.parse(json["check_out_date"]),
        checkOutHour:
            json["check_out_hour"] == null ? '' : json["check_out_hour"],
        price: json["price"] == null ? '' : json["price"],
        typeCard: json["type_card"] == null ? '' : json["type_card"],
        latitude: json["latitude"] == null ? '' : json["latitude"],
        longitude: json["longitude"] == null ? '' : json["longitude"],
        travel: json["travel"] == null ? null : json["travel"],
        id: json["id"] == null ? null : json["id"],
        seat: json["seat"] == null ? '' : json["seat"],
        boardingGate:
            json["boarding_gate"] == null ? '' : json["boarding_gate"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "check_in_date":
            "${checkInDate!.year.toString().padLeft(4, '0')}-${checkInDate!.month.toString().padLeft(2, '0')}-${checkInDate!.day.toString().padLeft(2, '0')}",
        "check_in_hour": checkInHour,
        "check_out_date": checkOutDate == null
            ? null
            : "${checkOutDate!.year.toString().padLeft(4, '0')}-${checkOutDate!.month.toString().padLeft(2, '0')}-${checkOutDate!.day.toString().padLeft(2, '0')}",
        "check_out_hour": checkOutHour == null ? null : checkOutHour,
        "price": price,
        "type_card": typeCard,
        "latitude": latitude,
        "longitude": longitude,
        "travel": travel,
        "id": id,
        "seat": seat == null ? null : seat,
        "boarding_gate": boardingGate == null ? null : boardingGate,
      };
}
