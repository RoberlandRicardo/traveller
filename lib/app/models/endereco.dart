import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:osm_nominatim/osm_nominatim.dart';

class Endereco {
  static const String paisColumn = "pais";
  static const String cidadeColumn = "cidade";
  static const String numeroColumn = "numero";
  static const String ruaColumn = "rua";
  static const String bairroColumn = "bairro";
  static const String latitudeColumn = "latitude";
  static const String longitudeColumn = "longitude";

  String pais = "";
  String cidade = "";
  String numero = "";
  String rua = "";
  String bairro = "";
  double latitude = 0;
  double longitude = 0;

  Endereco();

  Endereco.fromPlace(Place place) {
    pais = place.address?['country'];
    cidade = place.address?['town'];
    latitude = place.lat;
    longitude = place.lon;
  }

  Endereco.fromPlaceMark(Placemark placemark, Position position) {
    pais = placemark.country ?? "";
    cidade = placemark.subAdministrativeArea ?? "";
    rua = placemark.street ?? "";
    bairro = placemark.subLocality ?? "";
    latitude = position.latitude;
    longitude = position.longitude;
  }

  @override
  String toString() {
    return '${cidade}/${pais} - ${numero}, ${rua}, ${bairro}';
  }
}
