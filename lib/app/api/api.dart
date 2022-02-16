import 'package:traveller/app/api/consts.dart';
import 'package:http/http.dart' as http;
import 'package:traveller/app/stores/app_state.dart';

class Api {
  static Future<http.Response?> enviarRequisicao(
      {required String method,
      required String endpoint,
      Map? data,
      Map<String, String>? headers}) async {
    var request = url + porta + endpoint;
    http.Response? response = null;

    Map<String, String>? formatHeaders = headers;
    if (appStore.state.sessao != null) {
      formatHeaders = {
        'Authorization': 'Token ' + appStore.state.sessao!.token
      };
      if (headers != null) {
        formatHeaders = {...formatHeaders, ...headers};
      }
    }

    switch (method) {
      case 'GET':
        response = await http.get(Uri.parse(request), headers: formatHeaders);
        break;
      case 'POST':
        response = await http.post(Uri.parse(request),
            body: data, headers: formatHeaders);
        break;
      case 'PUT':
        response = await http.put(Uri.parse(request),
            body: data, headers: formatHeaders);
        break;
      case 'DELETE':
        response = await http.delete(Uri.parse(request),
            body: data, headers: formatHeaders);
        break;
    }

    return response;
  }
}
