import 'dart:convert';

class Ticket {
  // Ticket({
  //   this.address,
  //   this.checkInDate,
  //   this.checkInHour,
  //   this.seat,
  //   this.boardingGate,
  //   this.price,
  //   this.typeCard,
  //   this.latitude,
  //   this.longitude,
  //   this.travel,
  //   this.id,
  // });
  Ticket({
    required this.address,
    required this.checkInDate,
    required this.checkInHour,
    required this.seat,
    required this.boardingGate,
    required this.price,
    required this.typeCard,
    required this.latitude,
    required this.longitude,
    required this.travel,
    required this.id,
  });

  String address;
  DateTime checkInDate;
  String checkInHour;
  String seat;
  String boardingGate;
  String price;
  String typeCard;
  String latitude;
  String longitude;
  int travel;
  int id;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        address: json["address"],
        checkInDate: DateTime.parse(json["check_in_date"]),
        checkInHour: json["check_in_hour"],
        seat: json["seat"],
        boardingGate: json["boarding_gate"],
        price: json["price"],
        typeCard: json["type_card"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        travel: json["travel"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "check_in_date":
            "${checkInDate.year.toString().padLeft(4, '0')}-${checkInDate.month.toString().padLeft(2, '0')}-${checkInDate.day.toString().padLeft(2, '0')}",
        "check_in_hour": checkInHour,
        "seat": seat,
        "boarding_gate": boardingGate,
        "price": price,
        "type_card": typeCard,
        "latitude": latitude,
        "longitude": longitude,
        "travel": travel,
        "id": id,
      };
}
