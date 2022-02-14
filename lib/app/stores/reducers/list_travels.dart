import 'package:traveller/app/stores/app_state.dart';

AppState setListTravels(AppState state, dynamic payload) {
  AppState newState = state;
  newState.listTravels = payload;
  return newState;
}
