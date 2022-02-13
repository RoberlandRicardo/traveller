import 'package:traveller/app/stores/app_state.dart';

AppState setLocationUser(AppState state, dynamic payload) {
  AppState newState = state;
  newState.locationUser = payload;
  return newState;
}
