import 'package:traveller/app/models/sessao.dart';
import 'package:traveller/app/stores/app_state.dart';

AppState setToken(AppState state, dynamic payload) {
  AppState newState = state;
  if (state.sessao != null) {
    newState.sessao?.token = payload;
  } else {
    newState.sessao = Sessao(token: payload);
  }
  return newState;
}

AppState setSessao(AppState state, dynamic payload) {
  AppState newState = state;
  newState.sessao = payload;
  return newState;
}

AppState removeSessao(AppState state, dynamic payload) {
  AppState newState = state;
  newState.sessao = null;
  return newState;
}
