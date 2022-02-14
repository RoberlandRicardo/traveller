import 'package:traveller/app/database/off_authentication/database.dart';
import 'package:traveller/app/stores/app_state.dart';

AppState activateOffAuthentication(AppState state, dynamic payload) {
  AppState newState = state;
  newState.offAuthentication = true;
  DatabaseOffAuthentication.initDb();
  return newState;
}

AppState desactivateOffAuthentication(AppState state, dynamic payload) {
  AppState newState = state;
  newState.offAuthentication = false;
  DatabaseOffAuthentication.closeDB();
  return newState;
}
