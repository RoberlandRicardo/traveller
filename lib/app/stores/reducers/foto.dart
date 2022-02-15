import 'package:traveller/app/stores/app_state.dart';

AppState setFoto(AppState state, dynamic payload) {
  AppState newState = state;
  newState.foto = payload;
  return newState;
}
