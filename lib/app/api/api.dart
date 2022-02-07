import 'package:traveller/app/api/consts.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<http.Response?> enviarRequisicao(
      {required String method,
      required String endpoint,
      Map? data,
      Map<String, String>? headers}) async {
    var request = url + porta + endpoint;
    http.Response? response = null;

    switch (method) {
      case 'GET':
        response = await http.get(Uri.parse(request), headers: headers);
        break;
      case 'POST':
        response =
            await http.post(Uri.parse(request), body: data, headers: headers);
        break;
      case 'PUT':
        response =
            await http.put(Uri.parse(request), body: data, headers: headers);
        break;
      case 'DELETE':
        response =
            await http.delete(Uri.parse(request), body: data, headers: headers);
        break;
    }

    return response;
  }
}
