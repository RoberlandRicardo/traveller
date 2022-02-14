import 'package:traveller/app/models/travel.dart';
import 'package:traveller/app/stores/app_state.dart';

AppState initTravelCadastro(AppState state, dynamic payload) {
  AppState newState = state;
  newState.travelCadastro = Travel();
  return newState;
}

AppState setTravelCadastro(AppState state, dynamic payload) {
  AppState newState = state;
  newState.travelCadastro = payload;
  return newState;
}

AppState closeTravelCadastro(AppState state, dynamic payload) {
  AppState newState = state;
  newState.travelCadastro = null;
  return newState;
}
